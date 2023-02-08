variable "tags" {
  type = object({
    created_by = string
    project    = string
    team       = string
  })
  description = "Tags assigned to the resources."
}

variable "db_metadata" {
  type = object({
    identifier           = string
    instance_class       = string
    allocated_storage    = number
    engine               = string
    engine_version       = string
    major_engine_version = string
    family               = string
  })
  description = "RDS DB instance metadata."
}

variable "s3_bucket" {
  type        = any
  description = "Logs S3 bucket ID."
}