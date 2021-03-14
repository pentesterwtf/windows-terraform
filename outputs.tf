# outputs.tf

# Defines outputs of our playbooks!

output "host_address" {
  value       = libvirt_domain.domain-windows.network_interface[0].addresses[0]
  description = "The private IP address of the windows host."
}


