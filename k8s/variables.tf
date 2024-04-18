variable "compartment_id" {}

### NETWORK ###
variable "internet_gateways" {
  type = map(object({
    display_name = string
  }))
}

variable "nat_gateways" {
  type = map(object({
    display_name = string
  }))
}

variable "route_tables" {
  type = map(object({
    display_name = string
    route_rules = list(object({
      description = string
      destination = string
      destination_type = string
    }))
  }))
}

variable "service_gateways" {
  type = map(object({
    display_name = string
  }))
}

variable "vcns" {
  type = map(object({
    cidr_block = string
    display_name = string
    dns_label = string
  }))
}