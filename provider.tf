# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "${var.viuser}"
  password       = "${var.vipassword}"
  vsphere_server = "${var.viserver}"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vmdatastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vmrp}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vmnetlabel}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template" {
  name          = "${var.vmtemp}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "template_centos" {
  name          = "${var.vmtemp_centos}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
