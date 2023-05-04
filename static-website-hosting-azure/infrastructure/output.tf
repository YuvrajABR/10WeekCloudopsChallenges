output "storage_web_endpoint" {
  value       = azurerm_storage_account.storage_account.primary_web_endpoint
  sensitive   = false
  description = "description"
  depends_on  = []
}

output "storage_web_host" {
  value       = azurerm_storage_account.storage_account.primary_web_host
  sensitive   = false
  description = "description"
  depends_on  = []
}
