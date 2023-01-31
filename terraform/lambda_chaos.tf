# module "rds" {
#   source  = "terraform-aws-modules/rds/aws"
#   version = "5.3.0"
#   # insert the 1 required variable here
# }

# locals {
#   sar_application         = "arn:aws:serverlessrepo:eu-central-1:640663510286:applications/rds-audit-logs-s3"
#   sar_application_version = "0.0.2"
#   rds_instance_identifier = "mydb"
# }

# resource "aws_cloudformation_stack" "rds-audit-logs" {
#   name = "rds-audit-logs-${local.rds_instance_identifier}"

#   template_body = file("${path.module}/cf_template.yaml")

#   parameters = {
#     Name                  = "rds-audit-logs-${local.rds_instance_identifier}"
#     BucketName            = aws_s3_bucket.rds_audit_logs.id
#     RdsInstanceIdentifier = local.rds_instance_identifier
#     SarApplication        = local.sar_application
#     SarApplicationVersion = local.sar_application_version
#   }

#   capabilities = ["CAPABILITY_AUTO_EXPAND", "CAPABILITY_IAM"]
# }

# resource "aws_s3_bucket" "rds_audit_logs" {
#   bucket = "rds-audit-logs"
#   acl    = "private"
# }