output "topic_map" {
  description = "ID of Notification topic"
  value       = { for v in oci_ons_notification_topic.notification_topic : v.name => v.id }
}
