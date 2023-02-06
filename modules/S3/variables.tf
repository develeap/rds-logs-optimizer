variable "tags" {
  type        = map(any)
  description = "Tags assigned to the resources."
}

variable "s3_metadata" {
  type = object({
    bucket = string
    acl    = string
  })
  description = "Metadata of S3 bucket used to store logs from RDS instance."
}