  resource "azurerm_subscription_policy_assignment" "auditvms" {
  name = "audit-vm-manageddisks"
  subscription_id = "/subscriptions/79be621b-a188-406b-affb-2b0c00bc0d97"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/06a78e20-9358-41c9-923c-fb736d382a4d"
  description = "Shows all virtual machines not using managed disks"
  display_name = "Audit VMs without managed disks assignment"
  }
