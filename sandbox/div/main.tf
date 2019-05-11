### div

resource "azurerm_user_assigned_identity" "div-identity" {
  provider = "azurerm.cftapps-sandbox"

  resource_group_name = "${var.managed_identity_rg_name}"
  location            = "UK South"

  name = "test-div-sandbox"
}

variable "managed_identity_rg_name" {}
variable "resource_groups_resource_id" {}

resource "azurerm_resource_group" "div-shared-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-div-sandbox"
  location = "UK South"
}

resource "random_uuid" "div-shared-sandbox" {}

resource "azurerm_role_assignment" "div-shared-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.div-shared-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.div-identity.principal_id}"

  id = "${random_uuid.div-shared-sandbox.result}"
}

### div FRONTEND SANDBOX ###
resource "azurerm_resource_group" "test-div-frontend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-div-frontend-sandbox"
  location = "UK South"
}

resource "random_uuid" "test-div-frontend-sandbox" {}

resource "azurerm_role_assignment" "test-div-frontend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.test-div-frontend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.div-identity.principal_id}"

  id = "${random_uuid.test-div-frontend-sandbox.result}"
}

### div Backend SANDBOX ###
resource "azurerm_resource_group" "test-div-backend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-div-backend-sandbox"
  location = "UK South"
}

resource "random_uuid" "test-div-backend-sandbox" {}

resource "azurerm_role_assignment" "test-div-backend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.test-div-backend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.div-identity.principal_id}"

  id = "${random_uuid.test-div-backend-sandbox.result}"
}

resource "azurerm_resource_group" "div-data-sandbox" {
  provider = "azurerm.sandbox"

  name     = "div-backend-data-sandbox"
  location = "UK South"
}
