# output "otus_vm_login_command" {
#   value = "ssh ubuntu@${local.otus_vm_public_ip[*]}"
# }

# output "otus_vm_nginx_address" {
#   value = "http://${local.otus_vm_public_ip[*]}"
# }

output "otus_vm_nginx_address" {
  description = "otus_vm_nginx_address"
  value       = [for s in yandex_compute_instance.otus-vm-test : format("%s Public IP: %s", s.name, s.network_interface[0].nat_ip_address)]
}
