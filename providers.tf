terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.52.0"
    }
  }
  backend "s3" {
    bucket = "bucket-name"
    key    = "rds_optimizer"
    region = "sample-region"
  }
}

provider "aws" {
  region = var.aws_region
}