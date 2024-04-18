resource "oci_ons_subscription" "subscription" {
  for_each = var.subscriptions
  #Required
  compartment_id = var.compartment_id
  endpoint       = each.value.endpoint
  protocol       = each.value.protocol
  topic_id       = each.value.topic_id

  #Optional
  # defined_tags = {"Operations.CostCenter"= "42"}
  # freeform_tags = {"Department"= "Finance"}
}
