data "azurerm_key_vault" "kv" {
  name                = "${local.application_name}-key-vault"
  resource_group_name = azurerm_resource_group.rg.name
}