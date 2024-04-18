module "test_oke" {
  source         = "../live"
  compartment_id = var.compartment_ocid
  vcn_id         = module.sample_network.vcn_id
}

module "sample_network" {
  source                             = "../../../network/live"
  compartment_ocid                   = var.compartment_ocid
  vcn_cidr_block                     = "10.0.0.0/16"
  vcn_dns_label                      = "sample"
  vcn_display_name                   = "sample_vcn"
  public_security_list_display_name  = "pub_sample_security_list"
  private_security_list_display_name = "priv_sample_security_list"
  public_subnet_cidr_block           = "10.0.0.0/24"
  private_subnet_cidr_block          = "10.0.1.0/24"
  public_subnet_display_name         = "pub_sample_subnet"
  private_subnet_display_name        = "priv_sample_subnet"
  internet_gateway_display_name      = "sample_igw"
  route_table_display_name           = "sample_route_table"
  service_gateway_display_name       = "sample_SG"
  service_id                         = data.oci_core_services.services.services.0.id
  nat_gateway_display_name           = "sample_nat"
  load_balancer_enabled              = false
  load_balancer_display_name         = ""
  backend_set_name                   = ""
  listener_name                      = ""
}

data "oci_core_services" "services" {
}
