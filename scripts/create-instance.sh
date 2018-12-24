#!bin/bash
#
# create-instance.sh <id> <ip address> <num-of-cpu-core> <memory capasity MB> <app>
#    script file for terraform vmware instance creation
#

set -eu

cat << EOF > instance-$1.tf
resource "vsphere_virtual_machine" "instance-$1" {
  name             = "\${var.vmname}-$1"
  resource_pool_id = "\${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "\${data.vsphere_datastore.datastore.id}"

  num_cpus = "$3"
  memory   = "$4"
  guest_id = "\${data.vsphere_virtual_machine.template.guest_id}"

  tags = ["\${vsphere_tag.tag-$5.id}"]

  network_interface {
    network_id   = "\${data.vsphere_network.network.id}"
    adapter_type = "\${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }

  disk {
    label            = "disk0"
    size             = "\${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "\${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "\${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "\${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "\${var.vmname}-$1"
        domain    = "\${var.vmdomain}"
      }

      network_interface {
        ipv4_address = "$2"
        ipv4_netmask = 24
      }

      ipv4_gateway    = "10.32.210.1"
      dns_server_list = ["10.32.208.101"]
    }
  }
}
EOF
