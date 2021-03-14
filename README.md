# Windows Terraform

## Intent

* Vagrant is a terrible solution for Windows
* Gives us a simple Win10, or Server 2019 full of goodies
* Copy stuff from the `/sync` folder to `C:/sync`
* Always up to date thanks to another workflow

## Usage

```
terraform init
terraform apply -auto-approve
```

Teardown is similar:

```
terraform destroy -auto-approve
```

## Requirements

* Requires the following:
  * Terraform - https://www.terraform.io/downloads.html
  * Terraform-provider-libvirt - https://github.com/dmacvicar/terraform-provider-libvirt
  * libirt - See your distro documentation
* Alternatively, if using Fedora 33+:
   * These are all packaged at https://github.com/pentesterwtf/ansible-desktop/tree/master/roles/hashicorp

## Implementation

* Lives off the default network provided by Libvirt
  * `default` / `192.168.122.0/24` / NAT
  * This is to keep our flow simple