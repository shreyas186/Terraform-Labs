resource "azurerm_resource_group" "FirstResourceGroup" {
  name = var.resourceGroupName
  location = var.location
  tags = var.tags
}