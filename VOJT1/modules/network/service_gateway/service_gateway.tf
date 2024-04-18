resource "oci_core_service_gateway" "service_gateway" {
  for_each = var.service_gateways

  compartment_id = var.compartment_ocid

  services {
    #Required
    service_id = local.services_map[each.value.service].id
  }
  vcn_id = var.vcn.id

  #Optional
  display_name = each.value.display_name
}

data "oci_core_services" "services" {}

locals {
  services_map = { for i in data.oci_core_services.services.services : i.name => i }
}
