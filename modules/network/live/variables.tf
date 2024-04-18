### COMMON ##############################################
variable "compartment_ocid" {}

### VCN #################################################
variable "vcn_cidr_block" {}
variable "vcn_dns_label" {}
variable "vcn_display_name" {}
variable "internet_gateway_display_name" {}
variable "route_table_display_name" {}
variable "service_gateway_display_name" {}
variable "service_id" {}
variable "nat_gateway_display_name" {}

### SECURITY LIST #######################################
variable "public_security_list_display_name" {}
variable "private_security_list_display_name" {}

### SUBNET ##############################################
variable "public_subnet_cidr_block" {}
variable "private_subnet_cidr_block" {}
variable "public_subnet_display_name" {}
variable "private_subnet_display_name" {}

### LOAD BALANCER #######################################
variable "load_balancer_enabled" {}
variable "load_balancer_display_name" {}
variable "backend_set_name" {}
variable "listener_name" {}
