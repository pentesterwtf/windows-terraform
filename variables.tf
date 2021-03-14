# variables.tf

#------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults
#------------------------------------------------------------------------------

variable "iso_win10" {
  description = "The URL for a qcow2 image for windows 10"
  type        = string
  #default     = "https://pentesterwtf.s3-ap-southeast-2.amazonaws.com/qemu/windows-10-1904.qcow2"
  default = "https://minio.dev.pentester.wtf/magiccarpet/qemu/windows-server-2019-17763-nosysprep.qcow2"
  # 
}

## We default to system, but can also be qemu:///session if required
## Recommend leaving this as session
provider "libvirt" {
  uri = "qemu:///system"
}

terraform {
  required_version = ">= 0.14"
}