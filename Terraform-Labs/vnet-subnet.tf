#First we need to create Virtual Network
resource "azurerm_virtual_network" "myTerraformNetwork" {
  name = var.vnetname
  address_space = ["10.0.0.0/16"]
  location = var.location
  resource_group_name = azurerm_resource_group.SecondResourceGroup.name
  tags = var.tags
}
#Secondly we need to create subnet
resource "azurerm_subnet" "myTerraformSubnet" {
  name=var.subnet_name
  resource_group_name = azurerm_resource_group.SecondResourceGroup.name
  virtual_network_name = azurerm_virtual_network.myTerraformNetwork.name
  address_prefixes = ["10.0.2.0/24"]
  # tags = var.tags
}