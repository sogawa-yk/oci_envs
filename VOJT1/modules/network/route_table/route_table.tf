resource "oci_core_route_table" "route_table" {
  for_each = var.route_tables

  compartment_id = var.compartment_ocid

  vcn_id       = var.vcn_id
  display_name = each.value.display_name

  dynamic "route_rules" {
    iterator          = rule
    for_each          = each.value.route_rules
    network_entity_id = oci_core_internet_gateway.internet_gateway.id

    #Optional
    description      = rule.value.description
    destination      = rule.value.destination
    destination_type = rule.value.destination_type
  }
}
