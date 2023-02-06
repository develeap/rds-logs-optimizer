output "rds_logs_s3_bucket" {
  value       = aws_s3_bucket.rds_logs_bucket.id
  description = "S3 bucket used to store logs from RDS instance."
}