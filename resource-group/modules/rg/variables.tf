variable "location" {
  description = "The Azure Region in which all resources should be created."
}
variable "name" {
  description = "Define the name of the resource group to use"
}
variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resource group"
  default     = {}
}

variable "prevent_destroy" {
  description = "Prevent resource group destroy"
  type = bool
  default = false
}