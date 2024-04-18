variable "compartment_id" {}
variable "notification_topics" {
  description = "Notification topics to be created"
  type = map(object({
    name        = string
    description = string
  }))
}
