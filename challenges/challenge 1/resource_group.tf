resource "azurerm_resource_group" "rg" {
  name = "azrg-aks-dev-${var.resource_group_name}"
  location = var.resource_group_location
  tags = local.common_tags
}