variable "tags" {
  type = object({
    created_by = string
    project    = string
    team       = string
  })
  description = "Tags assigned to the resources."
}

variable "s3_bucket_name" {
  type        = string
  description = "The name of S3 bucket used to store logs from RDS instance."
}

variable "s3_bucket_versioning_status" {
  type        = string
  default     = "Enabled"
  description = "The S3 bucket versioning status."
}

variable "block_public_acls_bool" {
  type        = bool
  default     = true
  description = "The S3 bucket block public ACLs setting."
}

variable "block_public_policy_bool" {
  type        = bool
  default     = true
  description = "The S3 bucket block public policy setting."
}

variable "ignore_public_acls_bool" {
  type        = bool
  default     = true
  description = "The S3 bucket ignore public ACLs setting."
}

variable "restrict_public_buckets_bool" {
  type        = bool
  default     = true
  description = "The S3 bucket restrict public buckets setting."
}

variable "s3_bucket_sse_algorithm" {
  type        = string
  default     = "aws:kms"
  description = "The S3 bucket sse algorith."
}