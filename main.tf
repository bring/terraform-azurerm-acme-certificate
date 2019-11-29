module "mgmt_key_vault" {
  source         = "github.com/bring/terraform-azurerm-key-vault-secrets"
  name           = var.keyvault_name
  resource_group = var.resource_group
  secret_names   = [var.sp_client_id, var.sp_client_secret]
}

resource "tls_private_key" "acme-private-key" {
  algorithm = "RSA"
}

resource "acme_registration" "acme-account" {
  account_key_pem = tls_private_key.acme-private-key.private_key_pem
  email_address   = var.acme_account_email
}

resource "random_string" "cert-password" {
  length = 32
}

provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
  version = "1.5.0"
}

resource "acme_certificate" "domain-cert" {
  account_key_pem          = acme_registration.acme-account.account_key_pem
  common_name              = var.certificate_name
  certificate_p12_password = random_string.cert-password.result

  dns_challenge {
    provider = "azure"

    config = {
      AZURE_CLIENT_ID       = module.mgmt_key_vault.secrets_values[var.sp_client_id]
      AZURE_CLIENT_SECRET   = module.mgmt_key_vault.secrets_values[var.sp_client_secret]
      AZURE_SUBSCRIPTION_ID = var.subscription_id
      AZURE_TENANT_ID       = var.tenant_id
      AZURE_RESOURCE_GROUP  = var.resource_group
    }
  }
}
