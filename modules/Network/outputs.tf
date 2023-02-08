output "rds_optimizer_subnetworks" {
  value       = tolist(aws_subnet.rds_optimizer_subnetworks[*])
  description = "Public subnet(s) used for hosting server(s), being open to the outside world"
}

output "rds_optimizer_security_group" {
  value       = aws_security_group.rds_optimizer_security_group
  description = "Security Group used for load balancer and server(s)"
}