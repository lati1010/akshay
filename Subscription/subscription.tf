  resource "azurerm_subscription_policy_assignment" "AKSAzurePolicy" {
  name = "${substr("${var.name}", 0, min(length("${var.name}"), 20))}"
  subscription_id = var.resourceid
  policy_definition_id = var.definitionid
  description = var.name
  display_name = "${var.name}-${var.effect}"
  }
