output "subnetworks" {
  value       = tolist(aws_subnet.subnetworks[*])
  description = "Public subnet(s) used for hosting server(s), being open to the outside world"
}

output "security_group" {
  value       = aws_security_group.security_group
  description = "Security Group used for load balancer and server(s)"
}