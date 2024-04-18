module "monitoring_alarm" {
  source            = "../../modules/monitoring/alarm"
  compartment_id    = var.compartment_ocid
  monitoring_alarms = local.updated_monitoring_alarms
}

locals {
  updated_monitoring_alarms = {
    for key, alarm in var.monitoring_alarms : key => {
      destinations                                  = [module.notification_topic.topic_map["topic001"]]
      metric_compartment_id                         = var.compartment_ocid
      display_name                                  = alarm.display_name
      is_enabled                                    = alarm.is_enabled
      namespace                                     = alarm.namespace
      query                                         = alarm.query
      severity                                      = alarm.severity
      body                                          = alarm.body
      is_notifications_per_metric_dimension_enabled = alarm.is_notifications_per_metric_dimension_enabled
      message_format                                = alarm.message_format
      metric_compartment_id_in_subtree              = alarm.metric_compartment_id_in_subtree
      pending_duration                              = alarm.pending_duration
      repeat_notification_duration                  = alarm.repeat_notification_duration
      resolution                                    = alarm.resolution
      resource_group                                = alarm.resource_group
      suppression                                   = alarm.suppression
    }
  }
}

