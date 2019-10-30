variable "certificate_name" {
  description = "Name of the cerftificate to be generated"
}

variable "keyvault_name" {
  description = "Name of keyvault where service principal secrets are stored"
}

variable "sp_client_id" {
  description = "The keyvault key for the stored secret client id of the ACME service principal."
}

variable "sp_client_secret" {
  description = "The keyvault key for the stored secret client secret of the ACME service principal."
}

variable "acme_account_email" {
  description = "The email of the ACME account"
}

variable "subscription_id" {
  description = "The Azure subscription id"
}
variable "tenant_id" {
  description = "The Azure tenant id"
}

variable "resource_group" {
  description = "The Azure resource group to use."
}
