resource "oci_core_internet_gateway" "internet_gateway" {
  for_each = var.internet_gateways
  #Required
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn.id

  #Optional
  display_name = each.value.display_name
}

