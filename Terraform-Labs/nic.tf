resource "azurerm_network_interface" "myNIC" {
  count               = length(var.nicname)
  name                = (var.nicname[count.index])
  location            = var.location
  resource_group_name = azurerm_resource_group.SecondResourceGroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.myTerraformSubnet.id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id = azurerm_lb.example.frontend_ip_configuration[0].public_ip_address_id
    public_ip_address_id = azurerm_public_ip.example[count.index].id

  }
}
resource "azurerm_network_interface_security_group_association" "myNICSecurityGroupAssociation" {
  count               = length(var.nicname)
  network_interface_id          = azurerm_network_interface.myNIC[count.index].id
  network_security_group_id = azurerm_network_security_group.myNSG.id
}
# resource "azurerm_network_interface_backend_address_pool_association" "example" {
#   count                        = length(var.nicname)
#   network_interface_id         = azurerm_network_interface.myNIC[count.index].id
#   ip_configuration_name        = azurerm_network_interface.myNIC[count.index].ip_configuration[0].name
#   backend_address_pool_id      = azurerm_lb_backend_address_pool.example.id
#   # loadbalancer_id              = azurerm_lb.example.id
# }