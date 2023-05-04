resource "azurerm_resource_group" "resource_group" {
  name     = var.resourceGroupName
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storageAccountName
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_kind             = "StorageV2"
  account_replication_type = "LRS"

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_cdn_profile" "cdn_profile" {
  name                = var.cdnProfileName
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "cdn_endpoint" {
  name                = var.cdnEndpointName
  profile_name        = azurerm_cdn_profile.cdn_profile.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  origin {
    name      = azurerm_storage_account.storage_account.name
    host_name = azurerm_storage_account.storage_account.primary_web_host
  }
  origin_host_header = azurerm_storage_account.storage_account.primary_web_host
}