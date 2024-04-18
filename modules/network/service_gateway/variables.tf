variable "compartment_id" {}
variable "service_gateways" {
  type = map(object({
    display_name = string
  }))
}
variable "vcn_id" {}
