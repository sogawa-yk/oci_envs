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

locals {
  test_data = {
    security_list_1 = {
      ingress_rules = [
        {
          protocol    = "tcp"
          source      = "192.168.1.0/24"
          description = "Allow TCP traffic from a specific source"
          source_type = "CIDR_BLOCK"
          stateless   = true
          tcp_options = [
            {
              destination_port_range_max = 80
              destination_port_range_min = 80
              source_port_range = {
                max = 1024
                min = 1024
              }
            }
          ]
        }
      ]
      egress_rules = [
        {
          destination      = "0.0.0.0/0"
          protocol         = "icmp"
          description      = "Allow all ICMP traffic"
          destination_type = "CIDR_BLOCK"
          stateless        = true
          icmp_options     = [
            {
              type = 8
              code = -1
            }
          ]
        }
      ]
      security_list_display_name = "test-security-list-1"
    }
  }
}

module "test_module" {
  source = "./path/to/your/module/directory"

  for_each        = local.test_data
  compartment_id  = var.compartment_id
  vcn_id          = var.vcn_id
  security_lists  = local.test_data
}
