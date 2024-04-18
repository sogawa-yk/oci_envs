resource "oci_core_security_list" "test_security_list" {
  for_each        = var.security_lists
  compartment_id  = var.compartment_id
  vcn_id          = var.vcn_id
  display_name    = each.value.display_name

  dynamic "egress_security_rules" {
    for_each = each.value.egress_rules
    content {
      destination       = egress_rules.value.destination
      protocol          = egress_rules.value.protocol
      description       = egress_rules.value.description
      destination_type  = egress_rules.value.destination_type
      stateless         = each.value.stateless

      dynamic "icmp_options" {
        for_each = egress_rules.value.icmp_options
        content {
          type = icmp_options.value.source_port_range.type
          code = icmp_options.value.source_port_range.code
        }
      }

      dynamic "tcp_options" {
        for_each = egress_rules.value.tcp_options
        content {
          max = tcp_options.value.destination_port_range_max
          min = tcp_options.value.destination_port_range_min

          source_port_range {
            for_each = tcp_options.value.source_port_range
            max = each.value.max
            min = each.value.min
          }
        }
      }

      dynamic "udp_options" {
        for_each = egress_rules.value.udp_options
        content {
          max = udp_options.value.destination_port_range_max
          min = udp_options.value.destination_port_range_min

          source_port_range {
            for_each = upd_options.value.source_port_range
            max = each.value.max
            min = each.value.min
          }
        }
      }
    }
  }

  dynamic "ingress_security_rules" {
    for_each = each.value.ingress_rules
    content {
      protocol    = ingress_rules.value.security_list_ingress_security_rules_protocol
      source      = ingress_rules.value.security_list_ingress_security_rules_source
      description = ingress_rules.value.security_list_ingress_security_rules_description
      source_type = ingress_rules.value.security_list_ingress_security_rules_source_type
      stateless   = ingress_rules.value.security_list_ingress_security_rules_stateless

      dynamic "icmp_options" {
        for_each = ingress_rules.value.icmp_options
        content {
          type = icmp_options.value.type
          code = icmp_options.value.code
        }
      }

      dynamic "tcp_options" {
        for_each = ingress_rules.value.tcp_options
        content {
          max = tcp_options.value.destination_port_range_max
          min = tcp_options.value.destination_port_range_min

          source_port_range {
            for_each = tcp_options.value.source_port_range
            max = each.value.max
            min = each.value.min
          }
        }
      }

      dynamic "udp_options" {
        for_each = ingress_rules.value.udp_options
        content {
          max = udp_options.value.destination_port_range_max
          min = udp_options.value.destination_port_range_min

          source_port_range {
            for_each = udp_options.value.source_port_range
            max = each.value.max
            min = each.value.min
          }
        }
      }
    }
  }
}
