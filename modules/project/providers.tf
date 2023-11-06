terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.10"
    }
  }

  required_version = ">= 1.6"

  # define terraform cloud targets e.g. organization and workspace
  cloud {}

}