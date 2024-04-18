variable "subscriptions" {
  description = "Subscription to be created"
  type = map(object({
    endpoint = string
    protocol = string
    topic_id = string
  }))
}
