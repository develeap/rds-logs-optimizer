output "rds_hostname" {
  description = "RDS instance hostname"
  value       = module.RDS.rds_hostname
  sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = module.RDS.rds_port
  sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = module.RDS.rds_username
  sensitive   = true
}