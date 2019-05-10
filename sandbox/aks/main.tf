resource "azurerm_resource_group" "managed-identities-sandbox" {
  provider = "azurerm.cftapps-sandbox"

  name     = "managed-identities-sandbox"
  location = "UK South"
}