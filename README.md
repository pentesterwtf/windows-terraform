# Windows Terraform

## Intent

* Vagrant is a terrible solution for Windows
* Gives us a simple Win10, or Server 2019 full of goodies
  * Defaults to Server 2019
* Copy stuff from the `/sync` folder to `C:/sync`
* Always up to date thanks to another workflow
* Need something bigger/more featured/a Windows lab? See `https://github.com/pentesterwtf/windows-lab`

## Usage

* Edit `variables.tf` and pick the OS you want
  * Defaults to Server 2019, Can be swapped to Win10 (See `Image selection`)
* Initialise terraform
  * `terraform init`
* Apply
  * `terraform apply -auto-approve`
* Teardown is similar:
  * `terraform destroy -auto-approve`

* Already have one running? Supply a `name` and you can have multiple machines:
  * `terraform apply -auto-approve -var="name=windows_reversing"`
  * Note: take care of terraform state 

### Security considerations

* Not a hardened image
  * `vagrant/vagrant` everywhere, change credentials, etc
  * will have SSH enabled

## Requirements

* Requires the following:
  * Terraform - https://www.terraform.io/downloads.html
  * Terraform-provider-libvirt - https://github.com/dmacvicar/terraform-provider-libvirt
  * libirt - See your distro documentation
  * Ansible - If allowing provisioning to occur
* Alternatively, if using Fedora 33+:
   * These are all packaged at https://github.com/pentesterwtf/ansible-desktop/tree/master/roles/hashicorp

## Image selection  

* See `https://pentesterwtf.s3-ap-southeast-2.amazonaws.com/` for `qemu/windows-*` images
* `nosysprep` images do *not* have sysprep, and will have the same machine ID, but are faster to spin up
* all other images will run sysprep on first boot, which is ideal for a domain environment, but will take longer to start initially
* You're probably going to be OK with `nosysprep` images

## Implementation

* Lives off the default network provided by Libvirt
  * `default` / `192.168.122.0/24` / NAT
  * This is to keep our flow simple
* This does *not* use a base image
  * This will pull a new image *every time* you spin this up
  * See https://github.com/dmacvicar/terraform-provider-libvirt/blob/master/website/docs/r/volume.html.markdown