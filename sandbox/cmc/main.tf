### CMC

resource "azurerm_user_assigned_identity" "cmc-identity" {
  provider = "azurerm.cftapps-sandbox"

  resource_group_name = "${var.managed_identity_rg_name}"
  location            = "UK South"

  name = "test-cmc-sandbox"
}

variable "managed_identity_rg_name" {}
variable "resource_groups_resource_id" {}

resource "azurerm_resource_group" "cmc-shared-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-cmc-sandbox"
  location = "UK South"
}

resource "random_uuid" "cmc-shared-sandbox" {}

resource "azurerm_role_assignment" "cmc-shared-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.cmc-shared-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"

  id = "${random_uuid.cmc-shared-sandbox.result}"
}

### CMC FRONTEND SANDBOX ###
resource "azurerm_resource_group" "test-cmc-frontend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-cmc-frontend-sandbox"
  location = "UK South"
}

resource "random_uuid" "test-cmc-frontend-sandbox" {}

resource "azurerm_role_assignment" "test-cmc-frontend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.test-cmc-frontend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"
  id                   = "${random_uuid.test-cmc-frontend-sandbox.result}"
}

### CMC Backend SANDBOX ###
resource "azurerm_resource_group" "test-cmc-backend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-cmc-backend-sandbox"
  location = "UK South"
}

resource "random_uuid" "test-cmc-backend-sandbox" {}

resource "azurerm_role_assignment" "test-cmc-backend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.test-cmc-backend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"

  id = "${random_uuid.test-cmc-backend-sandbox.result}"
}

resource "azurerm_resource_group" "cmc-data-sandbox" {
  provider = "azurerm.sandbox"

  name     = "cmc-backend-data-sandbox"
  location = "UK South"
}
