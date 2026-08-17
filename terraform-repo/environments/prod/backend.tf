terraform {
  backend "azurerm" {
    resource_group_name  = "kamz-ai-1"
    storage_account_name = "projectstate01"
    container_name       = "tfstate"
    key                  = "prod.tfstate"

    use_azuread_auth = true
  }
}
