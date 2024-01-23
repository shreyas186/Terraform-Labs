resource "azurerm_resource_group" "SecondResourceGroup" {
  name = var.resourceGroupName
  location = var.location
  tags = var.tags
}