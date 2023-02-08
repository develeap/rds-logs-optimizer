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

variable "subnetworks" {
  type        = any
  description = "Network module's Subnet."
}

variable "security_group" {
  type        = any
  description = "Network module's Security Group."
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