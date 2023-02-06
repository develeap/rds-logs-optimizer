variable "rds_logs_tags" {
  type = object({
    created_by = string
    project    = string
    team       = string
  })
  description = "Tags assigned to the resources."
}

variable "rds_logs_db_instance_metadata" {
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

variable "rds_logs_s3_bucket" {
  type        = any
  description = "The logs storing S3 bucket's id."
}