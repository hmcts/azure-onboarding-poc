### probate

resource "azurerm_user_assigned_identity" "probate-identity" {
  provider = "azurerm.cftapps-sandbox"

  resource_group_name = "${var.managed_identity_rg_name}"
  location            = "UK South"

  name = "test-probate-sandbox"
}

variable "managed_identity_rg_name" {}
variable "resource_groups_resource_id" {}

resource "azurerm_resource_group" "probate-shared-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-probate-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "probate-shared-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.probate-shared-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.probate-identity.principal_id}"
}

### probate FRONTEND SANDBOX ###
resource "azurerm_resource_group" "test-probate-frontend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-probate-frontend-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "test-probate-frontend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.test-probate-frontend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.probate-identity.principal_id}"
}

### probate Backend SANDBOX ###
resource "azurerm_resource_group" "test-probate-backend-sandbox" {
  provider = "azurerm.sandbox"

  name     = "test-probate-backend-sandbox"
  location = "UK South"
}

resource "azurerm_role_assignment" "test-probate-backend-sandbox" {
  provider = "azurerm.sandbox"

  scope                = "${var.resource_groups_resource_id}${azurerm_resource_group.test-probate-backend-sandbox.name}"
  role_definition_name = "Reader"
  principal_id         = "${azurerm_user_assigned_identity.probate-identity.principal_id}"
}

resource "azurerm_resource_group" "probate-data-sandbox" {
  provider = "azurerm.sandbox"

  name     = "probate-backend-data-sandbox"
  location = "UK South"
}
