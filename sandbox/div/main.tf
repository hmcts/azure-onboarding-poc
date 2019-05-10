### div

resource "azurerm_user_assigned_identity" "div-identity" {
  provider = "azurerm.cftapps-sandbox"

  resource_group_name = "managed-identities-sandbox"
  location            = "UK South"

  name = "search-api"
}

resource "azurerm_resource_group" "div-shared-sandbox" {
  provider = "azurerm.sandbox"

  name     = "div-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "div-shared-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${azurerm_resource_group.div-shared-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.div-identity.principal_id}"
}


### div FRONTEND SANDBOX ###
resource "azurerm_resource_group" "div-frontend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "div-frontend-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "div-frontend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${azurerm_resource_group.div-frontend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.div-identity.principal_id}"
}

### div Backend SANDBOX ###
resource "azurerm_resource_group" "div-backend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "div-backend-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "div-backend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${azurerm_resource_group.div-backend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.div-identity.principal_id}"
}

resource "azurerm_resource_group" "div-data-sandbox" {
  provider = "azurerm.sandbox"

  name     = "div-backend-data-sandbox"
  location = "UK South"
}

