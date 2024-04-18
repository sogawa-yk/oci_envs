resource "oci_core_subnet" "public_subnet" {

  # Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  cidr_block     = var.public_subnet_cidr_block

  # Optional
  # Caution: For the route table id, use module.vcn.nat_route_id.
  # Do not use module.vcn.nat_gateway_id, because it is the OCID for the gateway and not the route table.
  route_table_id    = oci_core_route_table.public_route_table.id
  security_list_ids = [oci_core_security_list.public_security_list.id]
  display_name      = var.public_subnet_display_name
}

resource "oci_core_subnet" "private_subnet" {

  # Required
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_vcn.vcn.id
  cidr_block     = var.private_subnet_cidr_block

  # Optional
  # Caution: For the route table id, use module.vcn.nat_route_id.
  # Do not use module.vcn.nat_gateway_id, because it is the OCID for the gateway and not the route table.
  route_table_id             = oci_core_route_table.private_route_table.id
  security_list_ids          = [oci_core_security_list.private_security_list.id]
  display_name               = var.private_subnet_display_name
  prohibit_public_ip_on_vnic = true
}
