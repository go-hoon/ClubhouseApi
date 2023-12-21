resource "azurerm_resource_group" "rg" {
  name     = "${local.application_name}-resource-group"
  location = local.region
}