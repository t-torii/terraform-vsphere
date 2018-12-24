resource "vsphere_tag_category" "category" {
  name        = "terraform-ansible-playbook-category"
  description = "Managed by Terraform"
  cardinality = "MULTIPLE"

  associable_types = [
    "VirtualMachine",
  ]
}

resource "vsphere_tag" "tag-nginx" {
  name        = "nginx"
  category_id = "${vsphere_tag_category.category.id}"
  description = "Managed by Terraform"
}

resource "vsphere_tag" "tag-postgres" {
  name        = "postgres"
  category_id = "${vsphere_tag_category.category.id}"
  description = "Managed by Terraform"
}
