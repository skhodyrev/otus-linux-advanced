resource "yandex_compute_instance" "otus-vm-test" {
  name        = "otus-vm-test"
  platform_id = "standard-v3" # ice lake
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8n6sult0bipcm75u12" # ubuntu 22.04 LTS
    }
  }

  network_interface {
    subnet_id      = yandex_vpc_subnet.otus_network_a.id
    nat            = true
    nat_ip_address = local.otus_vm_public_ip
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  depends_on = [yandex_vpc_address.otus_vm_public_ip]
}

resource "yandex_vpc_network" "otus_vpc" {}

resource "yandex_vpc_subnet" "otus_network_a" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.otus_vpc.id
  v4_cidr_blocks = ["10.10.10.0/28"]
}


resource "yandex_vpc_address" "otus_vm_public_ip" {
  name = "otus-vm-public-address"

  external_ipv4_address {
    zone_id = "ru-central1-a"
  }

  depends_on = [yandex_vpc_network.otus_vpc]
}


resource "local_file" "AnsibleInventory" {
  content = templatefile("inventory.tmpl",
    {
      nginx_name    = yandex_compute_instance.otus-vm-test.name
      nginx_ip      = local.otus_vm_public_ip
      username      = "ubuntu",
      ssh_nginx_key = "~/.ssh/id_rsa"
    }
  )
  filename = "inventory.ini"

  depends_on = [yandex_compute_instance.otus-vm-test]
}

resource "null_resource" "run_ansible" {
  triggers = {
    always_run = "${timestamp()}"
  }

  depends_on = [local_file.AnsibleInventory]

  provisioner "local-exec" {
    command = "ansible-playbook nginx-install.yml"
  }
}


locals {
  otus_vm_public_ip = yandex_vpc_address.otus_vm_public_ip.external_ipv4_address[0].address
}
