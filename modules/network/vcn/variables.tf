variable "compartment_id" {}
variable "vcns" {
  type = map(object({
    cidr_block   = string
    display_name = string
    dns_label    = string
  }))
}
