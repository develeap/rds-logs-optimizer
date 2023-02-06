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

variable "rds_logs_cidr_blocks" {
  type        = list(string)
  description = "CIDR block(s) for the subnet(s)"
}

variable "rds_logs_availability_zones" {
  type        = list(string)
  description = "Avaliability zones"
}

variable "rds_logs_ingress_rule_one" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  })
  description = "First Inbound Rule"
}

variable "rds_logs_ingress_rule_two" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = string
  })
  description = "Second Inbound Rule"
}

variable "rds_logs_egress_rule" {
  type = object({
    description      = string
    from_port        = number
    to_port          = number
    protocol         = string
    cidr_blocks      = string
    ipv6_cidr_blocks = string
  })
  description = "First Outbound Rule"
}

variable "rds_logs_vpc_ip_range" {
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

variable "rds_logs_route_table_ip_range" {
  type        = string
  description = "IP range for the routing table."
}

variable "rds_logs_security_group" {
  type = object({
    name        = string
    description = string
  })
  description = "Security Group metadata."
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

variable "rds_logs_s3_metadata" {
  type = object({
    bucket = string
    acl    = string
  })
  description = "Metadata of S3 bucket used to store logs from RDS instance."
}