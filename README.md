# terraform-azurerm-acme-certificate

Creates a TLS certificate using Let's Encrypt / ACME. Outputs the certificate in p12 format along with the name and password (auto-generated), and the domain name certificate was generated for.

Needs a Service Principal id and secret that _must_ be fetched from a specified key-vault.

Example usage:

```hcl-terraform
data "azurerm_subscription" "current" {}

data "terraform_remote_state" "tfstate" {
  backend = "azurerm"
  config = {
    resource_group_name  = "my-resource-group"
    storage_account_name = "my-storage-account"
    container_name       = "tfstate"
    key                  = "my.tfstate"
  }
}

module "qa-bring-support-certificate" {
  source             = "github.com/bring/terraform-azurerm-acme-certificate"
  certificate_name   = "my.domain"
  acme_account_email = "myemail@example.com"
  keyvault_name      = "my-keyvault"
  sp_client_id       = "my-service-principal-id"
  sp_client_secret   = "my-service-principal-password"
  resource_group     = data.terraform_remote_state.tfstate.config.resource_group_name
  subscription_id    = data.azurerm_subscription.current.subscription_id
  tenant_id          = data.azurerm_subscription.current.tenant_id
}
```