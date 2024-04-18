variable "compartment_id" {
  type = string
}

variable "vcn_id" {
  type = string
}

variable "nat_gateways" {
  type = map(object({
    display_name = string
  }))
}
