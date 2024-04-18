variable "security_lists" {
  type    = map(object({
    ingress_rules = list(object({
      protocol                     = string
      source                       = string
      description                  = string
      source_type                  = string
      stateless                    = bool
      icmp_options                 = list(object({
        type                       = number
        code                       = number
      }))
      tcp_options                  = list(object({
        destination_port_range_max  = number
        destination_port_range_min  = number
        source_port_range           = object({
          max                       = number
          min                       = number
        })
      }))
      udp_options                  = list(object({
        destination_port_range_max  = number
        destination_port_range_min  = number
        source_port_range           = object({
          max                       = number
          min                       = number
        })
      }))
    }))
    egress_rules  = list(object({
      destination                           = string
      protocol                              = string
      description                           = string
      destination_type                      = string
      stateless                             = bool
      icmp_options                          = list(object({
        type                               = number
        code                               = number
      }))
      tcp_options                           = list(object({
        destination_port_range_max          = number
        destination_port_range_min          = number
        source_port_range                   = object({
          max                               = number
          min                               = number
        })
      }))
      udp_options                           = list(object({
        destination_port_range_max          = number
        destination_port_range_min          = number
        source_port_range                   = object({
          max                               = number
          min                               = number
        })
      }))
    }))
    security_list_display_name = string
  }))
}

variable "compartment_id" {
  type = string
}

variable "vcn_id" {
  type = string
}
