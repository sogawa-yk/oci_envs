resource "oci_bastion_bastion" "test_bastion" {
  #Required
  bastion_type     = var.bastion_bastion_type
  compartment_id   = var.compartment_id
  target_subnet_id = var.subnet_id

  #Optional
  client_cidr_block_allow_list = var.bastion_client_cidr_block_allow_list
  dns_proxy_status             = var.bastion_dns_proxy_status
  max_session_ttl_in_seconds   = var.bastion_max_session_ttl_in_seconds
  name                         = var.bastion_name
}

resource "oci_bastion_session" "test_session" {
  #Required
  bastion_id = oci_bastion_bastion.test_bastion.id
  key_details {
    #Required
    public_key_content = var.session_key_details_public_key_content
  }
  target_resource_details {
    #Required
    session_type = var.session_target_resource_details_session_type

    #Optional
    target_resource_fqdn                       = var.session_target_resource_details_target_resource_fqdn
    target_resource_id                         = var.test_target_resource_id
    target_resource_operating_system_user_name = var.test_username
    target_resource_port                       = var.session_target_resource_details_target_resource_port
    target_resource_private_ip_address         = var.session_target_resource_details_target_resource_private_ip_address
  }

  #Optional
  display_name           = var.session_display_name
  key_type               = var.session_key_type
  session_ttl_in_seconds = var.session_session_ttl_in_seconds
}
