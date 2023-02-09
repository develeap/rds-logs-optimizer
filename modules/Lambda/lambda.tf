locals {
  # Lambda application code is created and owned by Personio GmbH, and has been used by develeap 
  # to create the terraform Lambda module as in: https://github.com/personio/rds-audit-logs-s3/blob/main/README.md

  # The copy provided below under "sar_application" local variable is a re-deployment
  # of original Personio GmbH SAR application. Credit given to Personio GmbH as the author,
  # based on the following license: https://github.com/personio/rds-audit-logs-s3/blob/main/LICENSE.txt

  sar_application         = "arn:aws:serverlessrepo:eu-north-1:006262944085:applications/rds-optimizer"
  sar_application_version = "1.0.0"
}

resource "aws_cloudformation_stack" "lambda_function" {
  # CloudFormation template is created and owned by Personio GmbH, and has been used by develeap
  # to create the terraform Lambda module as in: https://github.com/personio/rds-audit-logs-s3/blob/main/README.md

  name = "rds-audit-logs-${var.db_metadata["identifier"]}"

  template_body = file("${path.module}/cf_template.yaml")

  parameters = {
    Name                  = "rds-audit-logs-${var.db_metadata["identifier"]}"
    BucketName            = data.aws_s3_bucket.s3_bucket.bucket
    RdsInstanceIdentifier = var.db_metadata["identifier"]
    SarApplication        = local.sar_application
    SarApplicationVersion = local.sar_application_version
  }

  capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_IAM"]

  tags = var.tags
}