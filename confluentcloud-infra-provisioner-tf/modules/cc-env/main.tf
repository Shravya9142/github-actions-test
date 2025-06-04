terraform {
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "2.25.0"
    }
  }
}

resource "confluent_environment" "this" {
  display_name = var.environment_name
}
