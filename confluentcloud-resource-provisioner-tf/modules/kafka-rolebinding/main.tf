terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
    }
  }
}
resource "confluent_role_binding" "this" {
  for_each = { for rb in var.role_bindings : "${rb.principal}-${rb.role_name}-${rb.resource_name}" => rb }

  principal  = each.value.principal
  role_name  = each.value.role_name

  crn_pattern = "crn://confluent.cloud/organization=${var.org_id}/environment=${var.cc_environment_id}/kafka=${var.kafka_cluster_id}/${lower(each.value.resource_type)}=${each.value.resource_name}"
}

