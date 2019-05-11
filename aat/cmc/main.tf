### CMC

resource "azurerm_user_assigned_identity" "cmc-identity" {
  provider = "azurerm.cftapps-aat"

  resource_group_name = "${var.managed_identity_rg_name}"
  location            = "UK South"

  name = "test-cmc-aat"
}

variable "managed_identity_rg_name" {}
variable "resource_groups_resource_id" {}

resource "azurerm_resource_group" "cmc-shared-aat" {
  provider = "azurerm.aat"

  name     = "test-cmc-aat"
  location = "UK South"
}

resource "random_uuid" "cmc-shared-aat" { }

resource "azurerm_role_assignment" "cmc-shared-aat" {
  provider = "azurerm.aat"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.cmc-shared-aat.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"

  id = "${random_uuid.cmc-shared-aat.result}"
}

### CMC FRONTEND aat ###
resource "azurerm_resource_group" "test-cmc-frontend-aat" {
  provider = "azurerm.aat"

  name     = "test-cmc-frontend-aat"
  location = "UK South"
}

resource "random_uuid" "test-cmc-frontend-aat" { }

resource "azurerm_role_assignment" "test-cmc-frontend-aat" {
  provider = "azurerm.aat"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.test-cmc-frontend-aat.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"

  id = "${random_uuid.test-cmc-frontend-aat.result}"
}

### CMC Backend aat ###
resource "azurerm_resource_group" "test-cmc-backend-aat" {
  provider = "azurerm.aat"

  name     = "test-cmc-backend-aat"
  location = "UK South"
}

resource "random_uuid" "test-cmc-backend-aat" { }

resource "azurerm_role_assignment" "test-cmc-backend-aat" {
  provider = "azurerm.aat"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.test-cmc-backend-aat.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.cmc-identity.principal_id}"

  id = "${random_uuid.test-cmc-backend-aat.result}"
}

resource "azurerm_resource_group" "cmc-data-aat" {
  provider = "azurerm.aat"

  name     = "cmc-backend-data-aat"
  location = "UK South"
}
