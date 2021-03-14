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
  default     = "https://minio.dev.pentester.wtf/magiccarpet/qemu/windows-10.qcow2"
}

## We default to system, but can also be qemu:///session if required
## Recommend leaving this as session
provider "libvirt" {
  uri = "qemu:///system"
}

terraform {
  required_version = ">= 0.14"
}