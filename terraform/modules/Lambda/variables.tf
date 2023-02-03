variable "tags" {
  type        = map(any)
  description = "Tags assigned to the resources."
}

variable "db_instance_metadata" {
  type        = map(any)
  description = "RDS DB instance metadata."
}

variable "sar_application" {
  type        = string
  description = "SAR application ARN."
}

variable "sar_application_version" {
  type        = string
  description = "SAR application version."
}

variable "ninja_s3_bucket" {
  type = any
  description = "SAR application version."
}