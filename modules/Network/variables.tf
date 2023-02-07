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

variable "map_public_ip_on_launch_bool" {
  type        = bool
  description = "Map Public IP address in a subnet to be created? (True/False)"
  default     = false
}

variable "my_ip_address" {
  type        = any
  description = "My IP address"
}

variable "rds_logs_ingress_rule_one" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  })
  description = "First Inbound Rule"
}

variable "rds_logs_ingress_rule_two" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
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