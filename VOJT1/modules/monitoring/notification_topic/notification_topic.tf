resource "oci_ons_notification_topic" "notification_topic" {
  for_each = var.notification_topics
  #Required
  compartment_id = var.compartment_id
  name           = each.value.name

  #Optional
  #defined_tags  = { "Operations.CostCenter" = "42" }
  description = each.value.description
  #freeform_tags = { "Department" = "Finance" }
}

