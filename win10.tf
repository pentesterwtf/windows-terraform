resource "libvirt_volume" "win10" {
	name           = "win10"
	base_volume_id = libvirt_volume.win10-qcow2.id
	pool           = "default"
}

resource "libvirt_domain" "domain-windows10" {
	name       = "win10"
	memory     = 2048
	vcpu       = 1
	cpu = {
		mode = "host-passthrough"
	}

	network_interface {
		wait_for_lease = true
		hostname       = "win10"
		network_name   = "default"
	}

	disk{
		volume_id = libvirt_volume.win10.id
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
		host = self.network_interface.0.addresses.0
	}

	xml {
		xslt = file("evtouch.xsl")
	}

	provisioner "file" {
		source      = "sync/"
		destination = "C:/sync"
	}

}

