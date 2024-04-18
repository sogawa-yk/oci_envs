resource "oci_core_nat_gateway" "nat_gateway" {
  for_each       = var.nat_gateways
  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_id

  #Optional
  display_name = var.nat_gateways.display_name
}
