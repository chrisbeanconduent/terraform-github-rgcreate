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

resource "null_resource" "previous" {}

resource "time_sleep" "wait_300_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "300s"
 }

resource "null_resource" "next" {
  depends_on = [time_sleep.wait_300_seconds]
 }
}





