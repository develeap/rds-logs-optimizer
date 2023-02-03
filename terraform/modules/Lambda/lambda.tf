resource "aws_cloudformation_stack" "rds-audit-logs" {
  name = "rds-audit-logs-${var.db_instance_metadata["identifier"]}"

  template_body = file("${path.module}/cf_template.yaml")

  parameters = {
    Name                  = "rds-audit-logs-${var.db_instance_metadata["identifier"]}"
    BucketName            = data.aws_s3_bucket.ninja_s3_bucket.bucket_domain_name
    RdsInstanceIdentifier = var.db_instance_metadata["identifier"]
    SarApplication        = var.sar_application
    SarApplicationVersion = var.sar_application_version
  }

  capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_IAM"]

  tags = var.tags
}