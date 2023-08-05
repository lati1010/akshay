  resource "azurerm_subscription_policy_assignment" "cmkkeyforvms" {
  name = "vm-disk-cmkkey"
  subscription_id = "/subscriptions/79be621b-a188-406b-affb-2b0c00bc0d97"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/702dd420-7fcc-42c5-afe8-4026edd20fe0"
  description = "Shows all virtual machines not using managed disks"
  display_name = "OS and data disks should be encrypted with a customer-managed key"
  }
  resource "azurerm_resource_group_policy_assignment" "cmkkeyforvmsrg" {
  name = "vm-disk-cmkkeyrg"
  resource_group_id = var.resourceid
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/702dd420-7fcc-42c5-afe8-4026edd20fe0"
  description = "Shows all virtual machines not using managed disks"
  display_name = "OS and data disks should be encrypted with a customer-managed keyrg"
  }

