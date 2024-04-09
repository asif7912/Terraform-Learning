variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}

variable "environment" {
  description = "Resources target Environment"
  default     = "prod"
}

variable "location" {
  description = "Default resources target Location"
  default     = "West Europe"
}

variable "resource_groups"{
  description = "Resource group name"
  type = map(object({location = string, tags = map(string)}))
  default     = {}
}