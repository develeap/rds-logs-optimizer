resource "aws_s3_bucket" "rds_audit_logs" {
  bucket = var.s3_metadata["bucket"]

  tags = var.tags
}

resource "aws_s3_bucket_acl" "rds_audit_logs_acl" {
  bucket = aws_s3_bucket.rds_audit_logs.id
  acl    = var.s3_metadata["acl"]
}