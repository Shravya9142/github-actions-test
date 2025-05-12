variable "role_bindings" {
  description = "List of role bindings"
  type = list(object({
    principal      = string
    role_name      = string
    resource_type  = string
    resource_name  = optional(string)
    crn_pattern    = optional(string)
  }))
}

variable "kafka_cluster_id" {
  type        = string
  description = "Kafka cluster ID for scope (optional)"
  default     = ""
}
