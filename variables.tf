variable "aws_region" {
  type        = string
  description = "AWS Region in which the resources will be provisioned."
}

variable "tags" {
  type = object({
    created_by = string
    project    = string
    team       = string
  })
  description = "Tags assigned to the resources."
}

variable "subnet_count" {
  type        = number
  description = "The number of subnets in VPC."
  default     = 3
}

variable "cidr_blocks" {
  type        = list(string)
  description = "CIDR block(s) for the subnet(s)"
}

variable "availability_zones" {
  type        = list(string)
  description = "Avaliability zones"
}

variable "map_public_ip_on_launch_bool" {
  type        = bool
  description = "Map Public IP address in a subnet to be created? (True/False)"
  default     = false
}

variable "ingress_rule_one" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  })
  description = "First Inbound Rule"
}

variable "ingress_rule_two" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  })
  description = "Second Inbound Rule"
}

variable "egress_rule" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  })
  description = "First Outbound Rule"
}

variable "vpc_ip_range" {
  type        = string
  description = "IP range for the VPC."
}

variable "enable_dns_support_bool" {
  type        = bool
  default     = true
  description = "Enable DNS support for the VPC (True/False)."
}

variable "enable_dns_hostnames_bool" {
  type        = bool
  default     = true
  description = "Enable DNS hostnames support for the VPC (True/False)."
}

variable "route_table_ip_range" {
  type        = string
  description = "IP range for the routing table."
}

variable "security_group" {
  type = object({
    name        = string
    description = string
  })
  description = "Security Group metadata."
}

variable "db_subnet_group_name" {
  type        = string
  description = "RDS DB subnet group name."
}

variable "db_metadata" {
  type = object({
    identifier              = string
    instance_class          = string
    allocated_storage       = number
    engine                  = string
    engine_version          = string
    major_engine_version    = string
    family                  = string
    backup_retention_period = number
  })
  description = "RDS DB instance metadata."
}

variable "publicly_accessible_bool" {
  type        = bool
  description = "RDS DB instance username."
  default     = false
}

variable "skip_final_snapshot_bool" {
  type        = bool
  description = "RDS DB instance username."
  default     = true
}

variable "storage_encrypted_bool" {
  type        = bool
  description = "RDS DB instance username."
  default     = true
}

variable "multi_az_bool" {
  type        = bool
  description = "RDS DB instance username."
  default     = true
}

variable "db_username" {
  type        = string
  description = "RDS DB instance username."
  sensitive   = true
}

variable "db_password" {
  type        = string
  description = "RDS DB instance password"
  sensitive   = true
}

variable "db_params" {
  type = object({
    option_group_name             = string
    params_group_name             = string
    server_audit_file_rotate_size = string
    server_audit_file_rotations   = string
  })
  description = "RDS DB instance paramter group."
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