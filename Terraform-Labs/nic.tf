resource "azurerm_network_interface" "myNIC" {
  name                = var.nicname
  location            = var.location
  resource_group_name = azurerm_resource_group.FirstResourceGroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.myTerraformSubnet.name
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.example.name
  }
}
resource "azurerm_network_interface_security_group_association" "myNICSecurityGroupAssociation" {
  network_interface_id          = azurerm_network_interface.myNIC.name
  network_security_group_id = azurerm_network_security_group.myNSG.name
}