variable "compartment_id" {
  type = string
}
variable "vcn_id" {
  type = string
}
variable "route_tables" {
  type = map(object({
    display_name = string
    route_rules = list(object({
      description      = string
      destination      = string
      destination_type = string
    }))
  }))
}
