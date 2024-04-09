variable "sa_name" {
  description = "Name of the storage account"  
}
variable "location" {
  description = "Location of the resource on Azure region."
}
variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
}

variable "account_kind" {
  description = "Defines the Kind of account. Valid options are Storage, StorageV2 and BlobStorage. Changing this forces a new resource to be created."
  type        = string
  default     = "Storage"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard"
}

variable "default_action" {
  description = "Defines permissions for accessibility to containers"
  type        = string
  default     = "Allow"
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS and ZRS."
  type        = string
  default     = "LRS"
}

variable "access_tier" {
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
  type        = string
  default     = "Hot"
}

variable "hns_enabled" {
  description = "Is Hierarchical Namespace enabled? Changing this forces a new resource to be created."
  type = bool
  default = true
}

variable "subnets"{
  description = "(Required) A map of resource vnet subnets."
  type = map(any)
}

variable "containers"{
  description = "(Required) A list of containers for blob storage"
  type = list(any)
  default = []
}
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}