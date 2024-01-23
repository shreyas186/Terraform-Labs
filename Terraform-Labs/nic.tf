resource "azurerm_network_interface" "myNIC" {
  count               = length(var.nicname)
  name                = (var.nicname[count.index])
  location            = var.location
  resource_group_name = azurerm_resource_group.FirstResourceGroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.myTerraformSubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.example[count.index].id
  }
}
resource "azurerm_network_interface_security_group_association" "myNICSecurityGroupAssociation" {
  count               = length(var.nicname)
  network_interface_id          = azurerm_network_interface.myNIC[count.index].id
  network_security_group_id = azurerm_network_security_group.myNSG.id
}