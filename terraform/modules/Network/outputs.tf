output "aws_vpc" {
  value       = aws_vpc.ninja_vpc
  description = "Virtual Private Cloud hosting all subnets and instances inside"
}

output "aws_subnet" {
  value       = tolist(aws_subnet.ninja_subnet[*])
  description = "Public subnet(s) used for hosting server(s), being open to the outside world"
}

output "aws_internet_gateway" {
  value       = aws_internet_gateway.ninja_igw
  description = "Internet Gateway to connect with instance(s)"
}

output "aws_security_group" {
  value       = aws_security_group.ninja_sg
  description = "Security Group used for load balancer and server(s)"
}