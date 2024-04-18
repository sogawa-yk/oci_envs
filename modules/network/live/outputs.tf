output "vcn_id" {
  value = oci_core_vcn.vcn.id
}

output "public_route_table_id" {
  value = oci_core_route_table.public_route_table
}

output "private_route_table_id" {
  value = oci_core_route_table.private_route_table
}

output "public_subnet_id" {
  value = oci_core_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = oci_core_subnet.private_subnet.id
}

output "load_balancer_id" {
  value = var.load_balancer_enabled ? oci_load_balancer_load_balancer.load_balancer[0].id : ""
}

output "load_balancer_backend_set_id" {
  value = var.load_balancer_enabled ? oci_load_balancer_backend_set.backend_set[0].id : ""
}

output "load_balancer_backend_set_name" {
  value = var.load_balancer_enabled ? oci_load_balancer_backend_set.backend_set[0].name : ""
}
