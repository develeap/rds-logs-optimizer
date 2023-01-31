variable "tags" {
  type        = map(any)
  description = "Tags assigned to the resources."
}

variable "no_of_subnets" {
  type        = number
  description = "Number of subnets"
  default     = 2
}

variable "cidr_block" {
  type        = list(string)
  description = "CIDR block(s) for the subnet(s)"
}

variable "availability_zone" {
  type        = list(string)
  description = "Avaliability zones"
}

variable "ingress_one" {
  type        = map(any)
  description = "First Inbound Rule"
}

variable "ingress_two" {
  type        = map(any)
  description = "Second Inbound Rule"
}

variable "egress_all" {
  type        = map(any)
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
  type        = map(any)
  description = "Security Group metadata."
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