output "rds_instance_hostname" {
  description = "RDS instance hostname"
  value       = module.RDS.rds_instance_hostname
}

output "rds_instance_port" {
  description = "RDS instance port"
  value       = module.RDS.rds_instance_port
}

output "rds_instance_username" {
  description = "RDS instance root username"
  value       = module.RDS.rds_instance_username
  sensitive   = true
}

output "rds_logs_s3_bucket" {
  description = "S3 bucket used to store logs from RDS instance."
  value       = module.S3.rds_logs_s3_bucket
}