resource "azurerm_public_ip" "example" {
  # count = length(var.ipaddress)
  name                = var.ipaddress
  resource_group_name = azurerm_resource_group.FirstResourceGroup.name
  location            = var.location
  allocation_method   = "Dynamic"

  tags = var.tags
}
resource "azurerm_lb" "example" {
  name                = "myLoadBalancer"
  resource_group_name = azurerm_resource_group.FirstResourceGroup.name
  location            = var.location

  frontend_ip_configuration {
    name                 = "myFrontendIP"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_lb_backend_address_pool" "example" {
  name                = "myBackendPool"
  # resource_group_name = azurerm_resource_group.FirstResourceGroup.name
  loadbalancer_id     = azurerm_lb.example.id
}