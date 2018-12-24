variable "viuser" {}

variable "vipassword" {}

variable "viserver" {}

variable "datacenter" {
  default = ""
}

// default VM name in vSphere
variable "vmname" {
  default = ""
}

// default Resource Pool
variable "vmrp" {
  default = ""
}

// default VM domain for guest customization
variable "vmdomain" {
  default = ""
}

// default datastore to deploy vmdk
variable "vmdatastore" {
  default = ""
}

// default VM Template
variable "vmtemp" {
  default = ""
}

// default VM Template
variable "vmtemp_centos" {
  default = ""
}

// map of the VM Network (vmdomain = "vmnetlabel")
variable "vmnetlabel" {
  default = ""
}
