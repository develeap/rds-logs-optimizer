output "ninja_rds_hostname" {
  description = "RDS instance hostname"
  value       = module.RDS.ninja_rds_hostname
  sensitive   = true
}

output "ninja_rds_port" {
  description = "RDS instance port"
  value       = module.RDS.ninja_rds_port
  sensitive   = true
}

output "ninja_rds_username" {
  description = "RDS instance root username"
  value       = module.RDS.ninja_rds_username
  sensitive   = true
}

output "ninja_s3_bucket" {
  description = "S3 bucket used to store logs from RDS instance."
  value       = module.S3.ninja_s3_bucket
}