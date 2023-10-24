resource "azurerm_subscription_policy_assignment" "akspols" {
  for_each = {for u in var.Audit_policies : u.policy_name => u }
  name = each.key
  subscription_id = var.resourceid
  policy_definition_id = each.value.def_id
  description = var.name
  display_name = "${var.name}"
  parameters = jsonencode({
    "Effect": {
      "value": var.effect
    }
  })
}


