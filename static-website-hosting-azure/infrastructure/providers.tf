terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  backend "azurerm" {
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  subscription_id = var.subscriptionId
  features {}
  skip_provider_registration = true
}