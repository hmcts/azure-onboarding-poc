# Configure the Azure Provider
provider "azurerm" {
  subscription_id = "a5453007-c32b-4336-9c79-3f643d817aea"
  alias = "cmc-aat"
}

### CMC

resource "azurerm_user_assigned_identity" "cmc-identity" {
  provider = "azurerm.cftapps-aat"

  resource_group_name = "managed-identities-aat"
  location            = "UK South"

  name = "search-api"
}

resource "azurerm_resource_group" "cmc-shared-aat" {
  provider = "azurerm.cmc-aat"

  name     = "cmc-aat"
  location = "UK South"
}

resource "azurerm_role_assignment" "cmc-shared-aat" {
  provider = "azurerm.cmc-aat"

  scope                = "${azurerm_resource_group.cmc-shared-aat.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"
}


### CMC FRONTEND aat ###
resource "azurerm_resource_group" "cmc-frontend-aat" {
  provider = "azurerm.cmc-aat"

  name     = "cmc-frontend-aat"
  location = "UK South"
}

resource "azurerm_role_assignment" "cmc-frontend-aat" {
  provider = "azurerm.cmc-aat"

  scope                = "${azurerm_resource_group.cmc-frontend-aat.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"
}

### CMC Backend aat ###
resource "azurerm_resource_group" "cmc-backend-aat" {
  provider = "azurerm.cmc-aat"

  name     = "cmc-backend-aat"
  location = "UK South"
}

resource "azurerm_role_assignment" "cmc-backend-aat" {
  provider = "azurerm.cmc-aat"

  scope                = "${azurerm_resource_group.cmc-backend-aat.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"
}

resource "azurerm_resource_group" "cmc-data-aat" {
  provider = "azurerm.cmc-aat"

  name     = "cmc-backend-data-aat"
  location = "UK South"
}

