variable "rds_logs_tags" {
  type = object({
    created_by = string
    project    = string
    team       = string
  })
  description = "Tags assigned to the resources."
}

variable "rds_logs_subnet_count" {
  type        = number
  description = "The number of subnets in VPC."
  default     = 3
}

variable "rds_optimizer_subnetworks" {
  type        = any
  description = "Network module's Subnet."
}

variable "rds_optimizer_security_group" {
  type        = any
  description = "Network module's Security Group."
}

variable "rds_logs_db_subnet_group_name" {
  type        = string
  description = "RDS DB subnet group name."
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

variable "rds_logs_db_instance_username" {
  type        = string
  description = "RDS DB instance username."
  sensitive   = true
}

variable "rds_logs_db_instance_password" {
  type        = string
  description = "RDS DB instance password"
  sensitive   = true
}

variable "rds_logs_db_instance_params" {
  type = object({
    option_group_name             = string
    params_group_name             = string
    server_audit_file_rotate_size = string
    server_audit_file_rotations   = string
  })
  description = "RDS DB instance paramter group."
}