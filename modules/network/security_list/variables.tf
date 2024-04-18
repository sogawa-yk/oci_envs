variable "compartment_id" {
  
}
variable "vcn_id" {
  
}
variable "security_lists" {
  description = "Map of security lists with configurations"
  type        = map(object({
    security_list_display_name               = string
    egress_rules                            = list(object({
      destination         = string
      protocol            = string
      description         = string
      destination_type    = string
      icmp_options               = list(object({
        type  = number
        code  = number
      }))
      stateless                 = bool
      tcp_options               = list(object({
        destination_port_range_max  = number
        destination_port_range_min  = number
        source_port_range           = object({
          max                       = number
          min                       = number
        })
      }))
      udp_options               = list(object({
        destination_port_range_max  = number
        destination_port_range_min  = number
        source_port_range           = object({
          max                       = number
          min                       = number
        })
      }))
    }))
    ingress_rules                           = list(object({
      protocol            = string
      source              = string
      description         = string
      icmp_options               = list(object({
        type  = number
        code  = number
      }))
      source_type         = string
      stateless           = bool
      tcp_options                = list(object({
        destination_port_range_max  = number
        destination_port_range_min  = number
        source_port_range           = object({
          max                       = number
          min                       = number
        })
      }))
      udp_options                = list(object({
        destination_port_range_max  = number
        destination_port_range_min  = number
        source_port_range           = object({
          max                       = number
          min                       = number
        })
      }))
    }))
  }))
}