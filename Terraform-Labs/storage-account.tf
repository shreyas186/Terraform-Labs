resource "random_id" "randomID" {
  keepers = {
    resource_group = azurerm_resource_group.FirstResourceGroup.name
  }
  byte_length = 8
}
resource "azurerm_storage_account" "storageAccount" {
  name                     = "diag${random_id.randomID.id}"
  resource_group_name      = azurerm_resource_group.FirstResourceGroup.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}