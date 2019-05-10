### CMC

resource "azurerm_user_assigned_identity" "cmc-identity" {
  provider = "azurerm.cftapps-sandbox"

  resource_group_name = "managed-identities-sandbox"
  location            = "UK South"

  name = "search-api"
}

resource "azurerm_resource_group" "cmc-shared-sandbox" {
  provider = "azurerm.sandbox"

  name     = "cmc-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "cmc-shared-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${azurerm_resource_group.cmc-shared-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"
}


### CMC FRONTEND SANDBOX ###
resource "azurerm_resource_group" "cmc-frontend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "cmc-frontend-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "cmc-frontend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${azurerm_resource_group.cmc-frontend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"
}

### CMC Backend SANDBOX ###
resource "azurerm_resource_group" "cmc-backend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "cmc-backend-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "cmc-backend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${azurerm_resource_group.cmc-backend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"
}

resource "azurerm_resource_group" "cmc-data-sandbox" {
  provider = "azurerm.sandbox"

  name     = "cmc-backend-data-sandbox"
  location = "UK South"
}

