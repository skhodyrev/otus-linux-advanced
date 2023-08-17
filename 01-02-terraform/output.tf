output "otus_vm_login_command" {
  value = "ssh ubuntu@${local.otus_vm_public_ip}"
}

output "otus_vm_nginx_address" {
  value = "http://${local.otus_vm_public_ip}"
}
