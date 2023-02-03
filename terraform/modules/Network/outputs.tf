output "ninja_vpc" {
  value       = aws_vpc.ninja_vpc
  description = "Virtual Private Cloud hosting all subnets and instances inside"
}

output "ninja_subnets" {
  value       = tolist(aws_subnet.ninja_subnets[*])
  description = "Public subnet(s) used for hosting server(s), being open to the outside world"
}

output "ninja_internet_gateway" {
  value       = aws_internet_gateway.ninja_igw
  description = "Internet Gateway to connect with instance(s)"
}

output "ninja_security_group" {
  value       = aws_security_group.ninja_sg
  description = "Security Group used for load balancer and server(s)"
}