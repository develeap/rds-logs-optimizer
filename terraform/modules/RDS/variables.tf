variable "tags" {
  type        = map(any)
  description = "Tags assigned to the resources."
}

variable "no_of_subnets" {
  type        = any
  description = "Tags assigned to the resources."
}

variable "ninja_vpc" {
  type        = any
  description = "Network module's VPC."
}

variable "ninja_subnets" {
  type        = any
  description = "Network module's Subnet."
}

variable "ninja_internet_gateway" {
  type        = any
  description = "Network module's Internet Gateway."
}

variable "ninja_security_group" {
  type        = any
  description = "Network module's Security Group."
}

variable "db_subnet_group_name" {
  type        = string
  description = "RDS DB subnet group name."
}

variable "db_instance_metadata" {
  type        = map(any)
  description = "RDS DB instance metadata."
}

variable "db_instance_username" {
  type        = string
  description = "RDS DB instance username."
  sensitive   = true
}

variable "db_instance_password" {
  type        = string
  description = "RDS DB instance password"
  sensitive   = true
}

variable "db_instance_publicly_accessible_bool" {
  type        = bool
  default     = true
  description = "RDS DB instance - publicly accessible (True/False)."
}

variable "db_instance_skip_final_snapshot_bool" {
  type        = bool
  default     = true
  description = "RDS DB instance - skip final snapshot (True/False)."
}

variable "db_instance_parameter_group" {
  type        = map(any)
  description = "RDS DB instance paramter group."
}

variable "db_instance_parameters_map" {
  type = object({
    name  = string
    value = string
  })
  description = "RDS DB instance paramter group."
}