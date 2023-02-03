output "ninja_s3_bucket" {
  value       = aws_s3_bucket.rds_audit_logs.id
  description = "S3 bucket used to store logs from RDS instance."
}