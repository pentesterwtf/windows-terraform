# main.tf

resource "libvirt_volume" "windows" {
  name   = "qemu-${var.name}.qcow2"
  pool   = "default"
  source = var.qcow_image_url
  format = "qcow2"
}

resource "libvirt_domain" "domain-windows" {
  name   = var.name
  memory = var.memory
  vcpu   = 2
  cpu = {
    mode = "host-passthrough"
  }

  network_interface {
    wait_for_lease = true
    network_name   = "default"
  }

  disk {
    volume_id = libvirt_volume.windows.id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = "true"
  }

  video {
    type = "virtio"
  }


  connection {
    type     = "winrm"
    user     = "vagrant"
    password = "vagrant"
    https    = "true"
    insecure = "true"
    host     = self.network_interface.0.addresses.0
  }

  xml {
    xslt = file("evtouch.xsl")
  }

  provisioner "file" {
    source      = "sync/"
    destination = "C:/sync/"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i \"${self.network_interface.0.addresses.0},\" ansible-playbook.yml --extra-vars \"hostname=${var.name}\""
  }

}

