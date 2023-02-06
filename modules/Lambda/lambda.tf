locals {
  sar_application         = "arn:aws:serverlessrepo:eu-central-1:640663510286:applications/rds-audit-logs-s3"
  sar_application_version = "1.0.1"
}

resource "aws_cloudformation_stack" "rds_logs_lambda_function" {
  name = "rds-audit-logs-${var.rds_logs_db_instance_metadata["identifier"]}"

  template_body = file("${path.module}/cf_template.yaml")

  parameters = {
    Name                  = "rds-audit-logs-${var.rds_logs_db_instance_metadata["identifier"]}"
    BucketName            = data.aws_s3_bucket.rds_logs_s3_bucket.bucket_domain_name
    RdsInstanceIdentifier = var.rds_logs_db_instance_metadata["identifier"]
    SarApplication        = local.sar_application
    SarApplicationVersion = local.sar_application_version
  }

  capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_IAM"]

  tags = var.rds_logs_tags
}