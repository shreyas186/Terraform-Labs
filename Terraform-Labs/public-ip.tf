resource "azurerm_public_ip" "example" {
  name                = var.ipaddress
  resource_group_name = azurerm_resource_group.FirstResourceGroup.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = var.tags
}