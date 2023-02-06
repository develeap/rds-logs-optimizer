output "rds_instance_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.rds_optimizer_db_instance.*.address
}

output "rds_instance_port" {
  description = "RDS instance port"
  value       = aws_db_instance.rds_optimizer_db_instance.*.port
}

output "rds_instance_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.rds_optimizer_db_instance.*.username
  sensitive   = true
}