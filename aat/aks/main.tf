resource "azurerm_resource_group" "managed-identities-aat" {
  provider = "azurerm.cftapps-aaa"

  name     = "managed-identities-aat"
  location = "UK South"
}

output "identity_rg_name" {
  value = "${azurerm_resource_group.managed-identities-aat.name}"
}
