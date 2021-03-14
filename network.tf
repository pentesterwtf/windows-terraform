resource "libvirt_network" "vm_network" {
  name      = "vm_network"
  addresses = [var.network_cidr_block]
  dns {
    enabled    = true
    local_only = false
    forwarders {
      address = "8.8.8.8"
    }
  }
}

