# RDS Optimizer

## Purpose

RDS Optimizer module is a solution that significantly reduces the cost of storing RDS database logs in AWS.

Instead of CloudWatch, the module provides an alternative in a Lambda serverless function that sources database logs from an RDS DB instance (facilitated with MariaDB Audit Plugin - suitable for MariaDB or MySQL only) and puts them into a designed S3 bucket, sorting them on a yearly, monthly, daily, and even hourly rate. Lambda is triggered 4 times an hour (every 15 minutes), lambda run timestamps being saved in a DynamoDB table so as to make sure that only the latest logs are sourced and no logs are lost in the process. Finally, the sorted logs can be easily queried using Athena.

As a result, thanks to the RDS Optimizer module, the overall costs of sourcing, keeping, and querying RDS DB instance audit logs can be decreased approximately tenfold.

## Architecture

The entire solution architecture is comprised of the following elements:
  - RDS DB instance (which can also be provided as an input from outside of the module scope if you have one already created),
  - Network components for RDS DB instance (as above, it can be provided from outside of the module scope along with RDS DB instance itself),
  - S3 bucket used for storing the logs,
  - CloudFormation stack, including:
    - DynamoDB table for storing lambda run timestamps,
    - Lambda function,
    - Lambda function log group,
    - Lambda function IAM role,
    - Lambda function trigger event (EventBridge),
    - Lambda function trigger event permission.
    
As in the graph below.

![RDS Optimizer architecture](/pictures/rds_optimizer_architecture.png "RDS Optimizer architecture")

## Sub-modules

The "RDS Optimizer" module is composed of four sub-modules which are connected to one another, as follows:
 - **Network module**: introducing a VPC, Subnets, Internet Gateway, Route Table, Security Group (a basis for RDS instance);
 - **RDS module**: using Network's subnets and security group as data sources, also introducing a DB subnet group, DB parameter group, DB option group, as well as RDS DB instance itself;
 - **S3 module**: using current user's ID as canonical user data source, also introducing a fully-configured S3 bucket that is later exported to Lambda module;
 - **Lambda module**: a Personio GmbH-owned one, from develeap's side only using S3 module's S3 bucket and a redeployed version of RDS Optimizer in Serverless Application Repository as data source; also introducing a CloudFormation stack with DynamoDB table and a fully-configured RDS Optimizer Lambda function included.

Find the sub-modules tree below.

```
modules
├── Lambda
│   ├── cf_template.yaml
│   ├── data.tf
│   ├── lambda.tf
│   ├── LICENSE.txt
│   └── variables.tf
├── Network
│   ├── network.tf
│   ├── outputs.tf
│   ├── security_groups.tf
│   └── variables.tf
├── RDS
│   ├── data.tf
│   ├── rds.tf
│   └── variables.tf
└── S3
    ├── bucket.tf
    ├── data.tf
    ├── outputs.tf
    └── variables.tf
```

## Variables

To run successfully, the RDS Optimizer module requires the following input variables:

```
variable "aws_region" {
  type        = string
  description = "AWS Region in which the resources will be provisioned."
}
```

```
variable "tags" {
  type = object({
    created_by = string
    project    = string
    team       = string
  })
  description = "Tags assigned to the resources."
}
```

```
variable "subnet_count" {
  type        = number
  description = "The number of subnets in VPC."
  default     = 3
}
```

```
variable "cidr_blocks" {
  type        = list(string)
  description = "CIDR block(s) for the subnet(s)"
}
```

```
variable "availability_zones" {
  type        = list(string)
  description = "Availability zones"
}
```

```
variable "map_public_ip_on_launch_bool" {
  type        = bool
  description = "Map Public IP address in a subnet to be created? (True/False)"
  default     = false
}
```

```
variable "ingress_rule_one" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  })
  description = "First Inbound Rule"
}
```

```
variable "ingress_rule_two" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  })
  description = "Second Inbound Rule"
}
```

```
variable "egress_rule" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  })
  description = "First Outbound Rule"
}
```

```
variable "vpc_ip_range" {
  type        = string
  description = "IP range for the VPC."
}
```

```
variable "enable_dns_support_bool" {
  type        = bool
  default     = true
  description = "Enable DNS support for the VPC (True/False)."
}
```

```
variable "enable_dns_hostnames_bool" {
  type        = bool
  default     = true
  description = "Enable DNS hostnames support for the VPC (True/False)."
}
```

```
variable "route_table_ip_range" {
  type        = string
  description = "IP range for the routing table."
}
```

```
variable "security_group" {
  type = object({
    name        = string
    description = string
  })
  description = "Security Group metadata."
}
```
```
variable "db_subnet_group_name" {
  type        = string
  description = "RDS DB subnet group name."
}
```

```
variable "db_metadata" {
  type = object({
    identifier              = string
    instance_class          = string
    allocated_storage       = number
    engine                  = string
    engine_version          = string
    major_engine_version    = string
    family                  = string
    backup_retention_period = number
  })
  description = "RDS DB instance metadata."
}
```

```
variable "publicly_accessible_bool" {
  type        = bool
  description = "RDS DB instance username."
  default     = false
}
```

```
variable "skip_final_snapshot_bool" {
  type        = bool
  description = "RDS DB instance username."
  default     = true
}
```

```
variable "storage_encrypted_bool" {
  type        = bool
  description = "RDS DB instance username."
  default     = true
}
```

```
variable "multi_az_bool" {
  type        = bool
  description = "RDS DB instance username."
  default     = true
}
```

```
variable "db_username" {
  type        = string
  description = "RDS DB instance username."
  sensitive   = true
}
```

```
variable "db_password" {
  type        = string
  description = "RDS DB instance password"
  sensitive   = true
}
```

```
variable "db_params" {
  type = object({
    option_group_name             = string
    params_group_name             = string
    server_audit_file_rotate_size = string
    server_audit_file_rotations   = string
  })
  description = "RDS DB instance parameter group."
}
```

```
variable "s3_bucket_name" {
  type        = string
  description = "The name of S3 bucket used to store logs from RDS instance."
}
```

```
variable "s3_bucket_versioning_status" {
  type        = string
  default     = "Enabled"
  description = "The S3 bucket versioning status."
}
```

```
variable "block_public_acls_bool" {
  type        = bool
  default     = true
  description = "The S3 bucket block public ACLs setting."
}
```

```
variable "block_public_policy_bool" {
  type        = bool
  default     = true
  description = "The S3 bucket block public policy setting."
}
```

```
variable "ignore_public_acls_bool" {
  type        = bool
  default     = true
  description = "The S3 bucket ignore public ACLs setting."
}
```

```
variable "restrict_public_buckets_bool" {
  type        = bool
  default     = true
  description = "The S3 bucket restrict public buckets setting."
}
```

```
variable "s3_bucket_sse_algorithm" {
  type        = string
  default     = "aws:kms"
  description = "The S3 bucket sse algorith."
}
```

As a proposed variables example you can use the ![Example RDS Optimizer .tfvars file](/rds_optimizer.tfvars.example "Example RDS Optimizer .tfvars file").

## Usage

Below you can find the instruction of how to use the module to decrease the cost of your RDS database's audit logs storage.

#### 1. Update the remote backend state file location in providers.tf file.

Change this part to your own s3 bucket which will be used to store the terraform.tfstate file:

```
backend "s3" {
  bucket = "bucket-name"
  key    = "rds_optimizer"
  region = "sample-region"
}
```

#### 2. Terraform apply

Use the `terraform apply -var-file rds_optimizer.tfvars -auto-approve` in your command line.
It should take approximately 20 minutes until the infrastructure is built.

#### 3. Check the resources

After the terraform manifest is applied successfully, I strongly recommend that you check if the resources are correctly deployed in your AWS panel. 

You should:
  - Check the RDS instance status

  ![RDS status](/pictures/rds_status.png "RDS status")


  - Check if Lambda function is applied correctly in Lambda Monitor tab and in Lambda CloudWatch Logs tab

  ![Lambda status metrics](/pictures/lambda_metrics.png "Lambda status metrics")
  ![Lambda status logs](/pictures/lambda_logs.png "Lambda status logs")


  - Check if S3 bucket is actually populated with the audit logs

  ![S3 bucket status](/pictures/s3_bucket_status.png "S3 bucket status")

#### 4. (Optionally) Run an Athena query

In the end you can run an Athena query from your S3 bucket-stored logs to prove the module working as it is supposed to.

Create a new table with partitioned data:

```
CREATE EXTERNAL TABLE logs_data (
`timestamp` string,
`serverhost` string
)
PARTITIONED BY (
  year int,
  month int,
  day int,
  hour int
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3://rds-optimizer-bucket/rds-optimizer-db/audit-logs/'
```

Run the query. Click on your table and choose 'Load partitions' options. Then click on the table again and choose 'Preview Table'.

The result should look similar to this:

![Athena query](/pictures/athena_query.png "Athena query")

## Credits and legal ownership

*The RDS Optimizer terraform module is owned by **Develeap** (![MIT License](/LICENSE "MIT License")), and is based on Lambda serverless function code originally written by **Personio GmbH**, released under the MIT License: https://github.com/personio/rds-audit-logs-s3/blob/main/LICENSE.txt*
