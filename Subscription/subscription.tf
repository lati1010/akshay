  resource "azurerm_subscription_policy_assignment" "AKSAzurePolicy" {
  name =var.name-var.subscription_id
  subscription_id = var.resourceid
  policy_definition_id = var.definitionid
  description = var.name
  display_name = var.name+var.effect
  }
