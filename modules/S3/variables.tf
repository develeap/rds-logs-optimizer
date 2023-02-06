variable "rds_logs_tags" {
  type = object({
    created_by = string
    project    = string
    team       = string
  })
  description = "Tags assigned to the resources."
}

variable "rds_logs_s3_metadata" {
  type = object({
    bucket = string
    acl    = string
  })
  description = "Metadata of S3 bucket used to store logs from RDS instance."
}