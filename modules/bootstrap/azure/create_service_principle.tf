# Configure Terraform
terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.15.0"
    }
  }
}

# Configure the Azure Active Directory Provider
provider "azuread" {
  tenant_id = local.tenant_id
}

# Retrieve domain information
#data "azuread_domains" "example" {
#  only_initial = true
#}

locals {
  inception_sa_name = "${local.name_prefix}-inception-tf"
}

# Create an application
resource "azuread_application" "inception" {
  display_name = local.inception_sa_name
}

# Create a service principal
resource "azuread_service_principal" "bootstrap" {
  application_id = azuread_application.inception.application_id
}

# Create resource group
resource "azurerm_resource_group" "bootstrap" {
  name     = "bootstrap"
  location = local.resource_group_location
}

