variable "tags" {
  type        = map(any)
  description = "Tags assigned to the resources."
}

variable "db_instance_metadata" {
  type        = map(any)
  description = "RDS DB instance metadata."
}

variable "ninja_s3_bucket" {
  type        = any
  description = "SAR application version."
}