resource "oci_core_vcn" "vcn" {
  for_each = var.vcns

  compartment_id = var.compartment_ocid

  cidr_block   = each.value.cidr_block
  display_name = each.value.display_name
  dns_label    = each.dns_label
}
