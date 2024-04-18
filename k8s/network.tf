
module "igw" {
  source = "../modules/network/internet_gateway"
  compartment_id = var.compartment_id
  vcn_id = vcn.id
  internet_gateways = var.internet_gateways
}

module "nat" {
  source = "../modules/network/nat_gateway"
  compartment_id = var.compartment_id
  vcn_id = vcn.id
  nat_gateways = var.nat_gateways
}

module "rts" {
  source = "../modules/network/route_table"
  compartment_id = var.compartment_id
  vcn_id = vcn.id
  route_tables = var.route_tables
}

## TODO SLのmodule作成する

module "sgw" {
  source = "../modules/network/service_gateway"
  compartment_id = var.compartment_id
  vcn_id = vcn.id
  service_gateways = var.service_gateways
}

module "vcn" {
  source = "../modules/network/vcn"
  compartment_id = var.compartment_id
  vcns = var.vcns
}