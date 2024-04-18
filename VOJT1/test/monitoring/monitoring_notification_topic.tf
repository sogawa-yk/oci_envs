module "notification_topic" {
  source              = "../../modules/monitoring/notification_topic"
  compartment_id      = var.compartment_ocid
  notification_topics = var.notification_topics
}
