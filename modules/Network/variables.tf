variable "tags" {
  type        = map(any)
  description = "Tags assigned to the resources."
}

variable "subnet_count" {
  type        = number
  description = "Tags assigned to the resources."
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

variable "ingress_rule_one" {
  type        = map(any)
  description = "First Inbound Rule"
}

variable "ingress_rule_two" {
  type        = map(any)
  description = "Second Inbound Rule"
}

variable "egress_rule" {
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