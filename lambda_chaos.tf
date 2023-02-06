# locals {
#   sar_application         = "arn:aws:serverlessrepo:eu-north-1:006262944085:applications/rds-audit-logs-s3"
#   sar_application_version = "1.0.0"
#   rds_instance_identifier = "mydb"
# }

# resource "aws_cloudformation_stack" "rds-audit-logs" {
#   name = "rds-audit-logs-${local.rds_instance_identifier}"

#   template_body = file("${path.module}/cf_template.yaml")

#   parameters = {
#     Name                  = "rds-audit-logs-${local.rds_instance_identifier}"
#     BucketName            = data.ninja_s3_bucket.id
#     RdsInstanceIdentifier = local.rds_instance_identifier
#     SarApplication        = local.sar_application
#     SarApplicationVersion = local.sar_application_version
#   }

#   capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_IAM"]
# }