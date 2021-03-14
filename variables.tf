# variables.tf

#------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
#------------------------------------------------------------------------------

# --- These are used for minio / backend config
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY


#------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults
#------------------------------------------------------------------------------

variable "network_cidr_block" {
  description = "The CIDR block for the windows lab network."
  type        = string
  default     = "10.0.10.0/24"
}

variable "iso_win10" {
  description = "The URL for a qcow2 image for windows 10"
  type        = string
  default     = "https://minio.dev.pentester.wtf/magiccarpet/qemu/windows-10.qcow2"
}
