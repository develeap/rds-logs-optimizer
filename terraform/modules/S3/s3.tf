resource "aws_s3_bucket" "rds_audit_logs" {
  bucket = var.s3_metadata["bucket"]
  acl    = var.s3_metadata["acl"]

  tags = var.tags
}