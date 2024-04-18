resource "oci_core_security_list" "test_security_list" {
  for_each        = var.security_lists
  compartment_id  = var.compartment_id
  vcn_id          = var.vcn_id
  display_name    = each.value.security_list_display_name

  dynamic "egress_security_rules" {
    for_each = each.value.egress_rules
    content {
      destination       = egress_security_rules.value.destination
      protocol          = egress_security_rules.value.protocol
      description       = egress_security_rules.value.description
      destination_type  = egress_security_rules.value.destination_type
      stateless         = egress_security_rules.value.stateless

      dynamic "icmp_options" {
        for_each = egress_security_rules.value.icmp_options
        content {
          type = icmp_options.value.type
          code = icmp_options.value.code
        }
      }

      dynamic "tcp_options" {
        for_each = egress_security_rules.value.tcp_options
        content {
          max = tcp_options.value.destination_port_range_max
          min = tcp_options.value.destination_port_range_min

          source_port_range {
            max = tcp_options.value.source_port_range.max
            min = tcp_options.value.source_port_range.min
          }
        }
      }

      dynamic "udp_options" {
        for_each = egress_security_rules.value.udp_options
        content {
          max = udp_options.value.destination_port_range_max
          min = udp_options.value.destination_port_range_min

          source_port_range {
            max = udp_options.value.source_port_range.max
            min = udp_options.value.source_port_range.min
          }
        }
      }
    }
  }

  dynamic "ingress_security_rules" {
    for_each = each.value.ingress_rules
    content {
      protocol    = ingress_security_rules.value.protocol
      source      = ingress_security_rules.value.source
      description = ingress_security_rules.value.description
      source_type = ingress_security_rules.value.source_type
      stateless   = ingress_security_rules.value.stateless

      dynamic "icmp_options" {
        for_each = ingress_security_rules.value.icmp_options
        content {
          type = icmp_options.value.type
          code = icmp_options.value.code
        }
      }

      dynamic "tcp_options" {
        for_each = ingress_security_rules.value.tcp_options
        content {
          max = tcp_options.value.destination_port_range_max
          min = tcp_options.value.destination_port_range_min

          source_port_range {
            max = tcp_options.value.source_port_range.max
            min = tcp_options.value.source_port_range.min
          }
        }
      }

      dynamic "udp_options" {
        for_each = ingress_security_rules.value.udp_options
        content {
          max = udp_options.value.destination_port_range_max
          min = udp_options.value.destination_port_range_min

          source_port_range {
            max = udp_options.value.source_port_range.max
            min = udp_options.value.source_port_range.min
          }
        }
      }
    }
  }
}
