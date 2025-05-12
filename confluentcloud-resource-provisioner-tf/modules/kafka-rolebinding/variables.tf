variable "role_bindings" {
  type = list(object({
    principal      = string
    role_name      = string
  }))
}

variable "kafka_cluster_id" {
  type = string
}

variable "cc_environment_id" {
  type = string
}

variable "org_id" {
  type = string
}
