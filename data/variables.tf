variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}

variable "environment" {
  description = "Resources target Environment"
  default     = "prod"
}

variable "location" {
  description = "Resources target Location"
  default     = "West Europe"
}

variable "resource_group" {
  description = "Resource group name"
  default     = null
}