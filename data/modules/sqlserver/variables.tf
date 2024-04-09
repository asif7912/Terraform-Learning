variable "mssql_server_name" {
  description = "Name of the storage account"  
}
variable "location" {
  description = "Name of Event Hub Namespace."
}

variable "resource_group_name" {
  description = "Name of resource group to deploy resources in."
}
variable "tags" {
  type = map(string)
  description = "Map of possible 'Tag's that can be assigned to MS SQL Server."
  default = { }
}

variable "mssql_server_version" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. Changing this forces a new resource to be created."
  type        = string
  default     = "12.0"
}

variable "minimum_tls_version" {
  description = "Minimum TLS version to use"
  default = "1.2"
}

variable "administrator_login" {
  description = "(Required) The administrator login name for the new server. Changing this forces a new resource to be created."
  type        = string
}

variable "administrator_login_password" {
  description = "(Required) The password associated with the administrator_login user. Needs to comply with Azure's Password Policy"
  type        = string
}

variable "connection_policy" {
  description = "(Optional) The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default"
  type = string
  default = "Default"
}
variable "subnets"{
  description = "(Required) A map of resource vnet subnets."
  type = list(any)
}