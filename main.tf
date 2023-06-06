terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.52.0"
    }
  }
}

provider "azurerm" {
environment = var.environment
tenant_id = var.tenant_id
subscription_id = var.subscription_id
client_id = var.client_id
client_secret = var.client_secret
features {}
}
 
resource "azurerm_resource_group" "test-group" {
name = var.name
location = var.location
create_duration = "60s"

resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 5"
  }
  triggers = {
    "before" = "${null_resource.before.id}"
  }
}

resource "null_resource" "after" {
  depends_on = ["null_resource.delay"]
}
}





