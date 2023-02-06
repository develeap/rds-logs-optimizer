data "aws_s3_bucket" "rds_logs_s3_bucket" {
  bucket = var.rds_logs_s3_bucket
}