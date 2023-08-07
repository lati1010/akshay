  resource "azurerm_subscription_policy_assignment" "subscription_policy_assignment" {
  name = "vm-disk-cmkkey"
  subscription_id = var.resourceid
  policy_definition_id = var.definitionid
  description = "Shows all virtual machines not using managed disks"
  display_name = "OS and data disks should be encrypted with a customer-managed key"
  }
  resource "azurerm_resource_group_policy_assignment" "resource_group_policy_assignment" {
  name = "vm-disk-cmkkeyrg"
  resource_group_id = var.resourceid
  policy_definition_id = var.definitionid
  description = "Shows all virtual machines not using managed disks"
  display_name = "OS and data disks should be encrypted with a customer-managed keyrg"
  }

