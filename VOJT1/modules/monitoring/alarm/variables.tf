variable "compartment_id" {}
variable "monitoring_alarms" {
  description = "Alarm to be created"
  type = map(object({
    destinations                                  = list(string)
    display_name                                  = string
    is_enabled                                    = bool
    metric_compartment_id                         = string
    namespace                                     = string
    query                                         = string
    severity                                      = string
    body                                          = string
    is_notifications_per_metric_dimension_enabled = bool
    message_format                                = string
    metric_compartment_id_in_subtree              = bool
    pending_duration                              = string
    repeat_notification_duration                  = string
    resolution                                    = string
    resource_group                                = string
    suppression = object({
      time_suppress_from  = string
      time_suppress_until = string
      description         = string
    })
  }))
}
