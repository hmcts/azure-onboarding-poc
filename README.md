# Azure resource group management

This repo is used for provisioning resource groups and permissions to those groups

The standard setup for resource groups for a team is normally:
* group per microservice that needs infrastructure
* database in a separate resource group
* shared resource group for resources such as Key Vault and Application Insights

These groups can have a "Role assignment" done on them to have permissions added.

At a minimum this is usually "Reader" access for the teams "User assigned Identity".
There are other roles that can be assigned such as "Storage Blob Data Contributor" if your app is interacting with a storage account.

See all built in roles here:
https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles

Note: the "Owner" is not allowed to be assigned, the CI in this repo will prevent it

## Getting started

You'll want to install `terraform` locally so you can check your changes are well formed.

If you are a new team then it's easiest if you copy an existing teams directory and find replace their name with yours.
Remove any groups you don't need

Run `terraform fmt` to format your change, and then open a pull request where it will be reviewed by members of the "devops" team.
You can message on slack to chase for review in #devops.

Only add groups into environments that you need, start with sandbox.

The first time your team is created in prod it needs additional approval.

## Questions

Contact us in #devops on slack