terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }

  backend "remote" {
    organization = "clubhouse-hoon"

    workspaces {
      name = "azure"
    }
  }
}

provider "azurerm" {
  features {}
}