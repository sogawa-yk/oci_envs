resource "oci_network_firewall_network_firewall" "test_network_firewall" {
  #Required
  compartment_id             = var.compartment_id
  network_firewall_policy_id = oci_network_firewall_network_firewall_policy.test_network_firewall_policy.id
  subnet_id                  = var.subnet_id

  #Optional
  display_name = "test-nfw"
}

resource "oci_network_firewall_network_firewall_policy" "test_network_firewall_policy" {
  #Required
  compartment_id = var.compartment_id

  #Optional
  display_name = "test_nfwp"
}

resource "oci_network_firewall_network_firewall_policy_service" "http_network_firewall_policy_service" {
  #Required
  name                       = "http_policy"
  network_firewall_policy_id = oci_network_firewall_network_firewall_policy.test_network_firewall_policy.id
  port_ranges {
    #Required
    minimum_port = 80

    #Optional
    maximum_port = 80
  }
  type = "TCP_SERVICE"
}

resource "oci_network_firewall_network_firewall_policy_service" "ssh_network_firewall_policy_service" {
  #Required
  name                       = "ssh_policy"
  network_firewall_policy_id = oci_network_firewall_network_firewall_policy.test_network_firewall_policy.id
  port_ranges {
    #Required
    minimum_port = 22

    #Optional
    maximum_port = 22
  }
  type = "TCP_SERVICE"
}

resource "oci_network_firewall_network_firewall_policy_service_list" "test_network_firewall_policy_service_list" {
  #Required
  name                       = "test_fnwpsl"
  network_firewall_policy_id = oci_network_firewall_network_firewall_policy.test_network_firewall_policy.id
  services = [oci_network_firewall_network_firewall_policy_service.http_network_firewall_policy_service.name,
  oci_network_firewall_network_firewall_policy_service.ssh_network_firewall_policy_service.name]
}
