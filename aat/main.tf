provider "azurerm" {
   version = "=1.24.0"
}

provider "azurerm" {
  subscription_id = "50f88971-400a-4855-8924-c38a47112ce4"
  alias           = "cftapps-aat"
}

provider "azurerm" {
  subscription_id = "a5453007-c32b-4336-9c79-3f643d817aea"
  alias           = "aat"
}

terraform {
  backend "azurerm" {}
}

variable "aat_subscription_id" {
  default = "a5453007-c32b-4336-9c79-3f643d817aea"
}

module "aks" {
  source = "./aks"
}

module "cmc" {
  source = "./cmc"

  managed_identity_rg_name    = "${module.aks.identity_rg_name}"
  resource_groups_resource_id = "/subscriptions/${var.aat_subscription_id}/resourceGroups/"
}
