resource "oci_monitoring_alarm" "alarm" {
  for_each = var.monitoring_alarms
  #Required
  compartment_id        = var.compartment_id
  destinations          = each.value.destinations
  display_name          = each.value.display_name
  is_enabled            = each.value.is_enabled
  metric_compartment_id = each.value.metric_compartment_id
  namespace             = each.value.namespace
  query                 = each.value.query
  severity              = each.value.severity

  #Optional
  body = each.value.body
  #defined_tags                                  = { "Operations.CostCenter" = "42" }
  #freeform_tags                                 = { "Department" = "Finance" }
  is_notifications_per_metric_dimension_enabled = each.value.is_notifications_per_metric_dimension_enabled
  message_format                                = each.value.message_format
  metric_compartment_id_in_subtree              = each.value.metric_compartment_id_in_subtree
  pending_duration                              = each.value.pending_duration
  repeat_notification_duration                  = each.value.repeat_notification_duration
  resolution                                    = each.value.resolution
  resource_group                                = each.value.resource_group
  suppression {
    #Required
    time_suppress_from  = each.value.suppression.time_suppress_from
    time_suppress_until = each.value.suppression.time_suppress_until

    #Optional
    description = each.value.suppression.description
  }
}


