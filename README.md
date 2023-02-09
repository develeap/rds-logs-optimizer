# RDS Optimizer

## Purpose

RDS Optimizer module is a solution that significantly reduces the cost of storing RDS database logs in AWS.

Instead of CloudWatch, the module provides an alternative in a Lambda serverless function that sources database logs from an RDS DB instance (facilitated with MariaDB Audit Plugin - sutiable for MariaDB or MySQL only) and puts them into a designed S3 bucket, sorting them on a yearly, monthly, daily, and even hourly rate. Lambda is triggered 4 times an hour (every 15 minutes), lambda run timestamps being saved in a DynamoDB table so as to make sure that only the latest logs are sourced and no logs are lost in the process. Finally, the sorted logs can be easily queried using Athena.

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
    - Lambda function trigger even permission.
    
As in a graph below.

![RDS Optimizer architecture](architecture/rds_optimizer.png "RDS Optimizer architecture")

## Sub-modules

[sub-modules tree and overview to be added here]

## Usage

[usage understanding part to be added here]

*The RDS Optimizer terraform module is owned by Develeap **(MIT License)**, and is based on Lambda serverless function code originally written by Personio GmbH, released under the MIT License: https://github.com/personio/rds-audit-logs-s3/blob/main/LICENSE.txt*
