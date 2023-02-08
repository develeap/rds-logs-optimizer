resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = var.s3_bucket_versioning_status
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = var.block_public_acls_bool
  block_public_policy     = var.block_public_policy_bool
  ignore_public_acls      = var.ignore_public_acls_bool
  restrict_public_buckets = var.restrict_public_buckets_bool
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_bucket_encryption_configuration" {
  bucket = aws_s3_bucket.s3_bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.s3_bucket_sse_algorithm
    }
  }
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id

  access_control_policy {
    grant {
      grantee {
        id   = data.aws_canonical_user_id.current.id
        type = "CanonicalUser"
      }
      permission = "READ"
    }

    owner {
      id = data.aws_canonical_user_id.current.id
    }
  }
}