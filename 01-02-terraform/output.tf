output "otus_vm_login_command" {
  value = "ssh ubuntu@${yandex_vpc_address.otus_vm_public_address.external_ipv4_address[0].address}"
}

output "otus_vm_nginx_address" {
  value = "http://${yandex_vpc_address.otus_vm_public_address.external_ipv4_address[0].address}"
}
