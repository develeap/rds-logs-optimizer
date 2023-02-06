resource "aws_s3_bucket" "rds_logs_bucket" {
  bucket = var.rds_logs_s3_metadata["bucket"]

  tags = var.rds_logs_tags
}

resource "aws_s3_bucket_acl" "rds_audit_logs_acl" {
  bucket = aws_s3_bucket.rds_logs_bucket.id
  acl    = var.rds_logs_s3_metadata["acl"]
}