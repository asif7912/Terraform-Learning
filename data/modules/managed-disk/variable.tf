variable "name" {
}
variable "location" {
}
variable "resource_group_name" {
}
variable "storage_account_type" {
}
variable "create_option" {
  
}
variable "disk_size_gb" {
  
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}