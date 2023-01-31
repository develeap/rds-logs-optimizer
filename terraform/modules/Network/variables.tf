variable "tags" {
  type        = map(any)
  description = "Tags assigned to the resources."
}

variable "no_of_subnets" {
  type        = number
  description = "Number of subnets"
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