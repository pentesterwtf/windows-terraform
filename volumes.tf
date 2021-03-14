resource "libvirt_volume" "win10-qcow2" {
  name   = "qemu-windows-10.qcow2"
  pool   = "default"
  source = var.iso_win10
  format = "qcow2"
}

