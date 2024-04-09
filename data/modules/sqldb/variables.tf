variable "sqldb01_name" {
 type = string
}
variable "sqlserver_id" {
 type = string
}
variable "sqldb01_collation" {
   type = string
}
/*
variable "sqldb01_license_type" {
   type = string
}
*/
variable "sqldb01_sku" {
   type = string
}
variable "sqldb01_max_size_gb" {
   type = string
}
variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}