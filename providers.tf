terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.5"
    }
  }

  required_version = ">= 1.4"

  # define terraform cloud targets e.g. organization and workspace
  cloud {}

}