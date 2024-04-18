### COMPUTE ###########################################
shape            = "VM.Standard.E4.Flex"
source_id        = "ocid1.image.oc1.ca-toronto-1.aaaaaaaaycvto7h4asfkdmizer3nbc57rowmcbuqwvqwed3ojkml4bi4lega"
source_type      = "image"
display_name     = "test_instance"
server_port      = 80
assign_public_ip = false
plugins_configs = [
  {
    desired_state = "ENABLED"
    name          = "Compute Instance Monitoring"
  },
  {
    desired_state = "ENABLED"
    name          = "Bastion"
}]

### NETWORK ###########################################
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
nat_gateway_display_name           = "sample_nat"
load_balancer_enabled              = false
load_balancer_display_name         = null
backend_set_name                   = null
listener_name                      = null

### BASTION ############################################
bastion_bastion_type                                               = "standard"
bastion_client_cidr_block_allow_list                               = ["0.0.0.0/0"]
bastion_dns_proxy_status                                           = "DISABLED"
bastion_max_session_ttl_in_seconds                                 = "1800"
bastion_name                                                       = "test_bastion"
session_target_resource_details_session_type                       = "MANAGED_SSH"
session_target_resource_details_target_resource_fqdn               = null
target_resource_operation_system_user_name                         = "opc"
session_target_resource_details_target_resource_port               = 22
session_target_resource_details_target_resource_private_ip_address = null
session_display_name                                               = "test_session"
session_key_type                                                   = "PUB"
session_session_ttl_in_seconds                                     = "1800"
