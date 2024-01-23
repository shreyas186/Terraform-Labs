resource "azurerm_public_ip" "example" {
  count = length(var.ipaddress)
  name                = var.ipaddress[string(count.index)]
  resource_group_name = azurerm_resource_group.FirstResourceGroup.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = var.tags
}