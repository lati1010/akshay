// Terraform Plugins version minimum requirement
//**********************************************************************************************
provider "azurerm" {
  version = ">=2.5.0"
  features {}
}
//**********************************************************************************************


// Backend Storage
//**********************************************************************************************
terraform {
  // Terraform Minimum version required
  required_version = ">= 0.12.12"
  backend "azurerm" {}
}
//**********************************************************************************************


// Data for Core Terraform remote state
//**********************************************************************************************
data "terraform_remote_state" "core" {
  backend = "azurerm"
  config = {
    resource_group_name  = var.remote_state_rg
    storage_account_name = var.remote_state_sa_name
    container_name       = var.remote_state_container
    key                  = var.remote_state_key_core
    subscription_id      = var.subscription_id
    tenant_id            = var.tenant_id
  }
}
//**********************************************************************************************


// Data for Pattern Terraform remote state
//**********************************************************************************************
data "terraform_remote_state" "pattern" {
  backend = "azurerm"
  config = {
    resource_group_name  = var.remote_state_rg
    storage_account_name = var.remote_state_sa_name
    container_name       = var.remote_state_container
    key                  = var.remote_state_key_pattern
    subscription_id      = var.subscription_id
    tenant_id            = var.tenant_id
  }
}
//**********************************************************************************************