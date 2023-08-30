resource "yandex_vpc_network" "otus_vpc" {
  
}

resource "yandex_vpc_subnet" "otus_network_a" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.otus_vpc.id
  v4_cidr_blocks = ["10.10.10.0/24"]
}

resource "yandex_vpc_subnet" "otus_network_b" {
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.otus_vpc.id
  v4_cidr_blocks = ["10.10.20.0/24"]
}