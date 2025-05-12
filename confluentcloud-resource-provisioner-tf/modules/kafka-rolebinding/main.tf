terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
    }
  }
}
resource "confluent_role_binding" "this" {
  for_each = {
    for rb in var.role_bindings : "${rb.principal}_${rb.role_name}_${rb.resource_type}_${rb.resource_name}" => rb
  }

  principal      = each.value.principal
  role_name      = each.value.role_name
  resource_type  = each.value.resource_type
  resource_name  = each.value.resource_name
  crn_pattern    = each.value.crn_pattern
  kafka_cluster  = var.kafka_cluster_id != "" ? var.kafka_cluster_id : null

  lifecycle {
    prevent_destroy = false
  }
}
