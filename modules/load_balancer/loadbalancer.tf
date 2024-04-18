resource "oci_load_balancer_load_balancer" "load_balancer" {
  count = var.load_balancer_enabled ? 1 : 0

  #Required
  compartment_id = var.compartment_ocid
  display_name   = var.load_balancer_display_name
  shape          = "flexible"
  subnet_ids     = [oci_core_subnet.public_subnet.id]

  #Optional
  ip_mode    = "IPV4"
  is_private = false

  shape_details {
    #Required
    maximum_bandwidth_in_mbps = 50
    minimum_bandwidth_in_mbps = 10
  }
}

resource "oci_load_balancer_backend_set" "backend_set" {
  count = var.load_balancer_enabled ? 1 : 0

  #Required
  health_checker {
    #Required
    protocol = "HTTP"
    url_path = "/"

    #Optional
    port = 80
  }
  load_balancer_id = oci_load_balancer_load_balancer.load_balancer[0].id
  name             = var.backend_set_name
  policy           = "LEAST_CONNECTIONS"
}

resource "oci_load_balancer_listener" "listener" {
  count = var.load_balancer_enabled ? 1 : 0

  #Required
  default_backend_set_name = oci_load_balancer_backend_set.backend_set[0].name
  load_balancer_id         = oci_load_balancer_load_balancer.load_balancer[0].id
  name                     = var.listener_name
  port                     = 80
  protocol                 = "HTTP"
}
