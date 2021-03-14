# variables.tf

#------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults
#------------------------------------------------------------------------------

variable "name" {
  description = "The name for the VM. Needs to be unique in libvirt"
  type        = string
  default     = "windows"
}

variable "memory" {
  description = "Amount of ram in megabytes."
  type        = string
  default     = "8192"
}

variable "qcow_image_url" {
  description = "The URL for a qcow2 image for Windows 10/Server 2019."
  # This defaults to Server 2019 without sysprep
  # The URLs you're looking for are listed below:
  # * Windows 10  - Sysprep - https://pentesterwtf.s3-ap-southeast-2.amazonaws.com/qemu/windows-10-1904.qcow2
  # * Windows 10  - No Sysprep - https://pentesterwtf.s3-ap-southeast-2.amazonaws.com/qemu/windows-10-1904-nosysprep.qcow2
  # * Server 2019 - Sysprep - https://pentesterwtf.s3-ap-southeast-2.amazonaws.com/qemu/windows-server-2019-17763.qcow2
  # * Server 2019 - No Sysprep - https://pentesterwtf.s3-ap-southeast-2.amazonaws.com/qemu/windows-server-2019-17763-nosysprep.qcow2
  type    = string
  default = "https://pentesterwtf.s3-ap-southeast-2.amazonaws.com/qemu/windows-server-2019-17763-nosysprep.qcow2"
}

#------------------------------------------------------------------------------
# Internal Variables
# You probably don't want to modify the below
#------------------------------------------------------------------------------

## We default to system, but can also be qemu:///session if required
## Recommend leaving this as session
provider "libvirt" {
  uri = "qemu:///system"
}

terraform {
  required_version = ">= 0.14"
}