  resource "azurerm_subscription_policy_assignment" "cmkkeyforvms" {
  name = "vm-disk-cmkke1y"
  subscription_id = var.resourceid
  policy_definition_id = var.definitionid
  description = "Shows all virtual machines not using managed disks"
  display_name = "OS and data disks should be encrypted with a customer-managed key"
  }
