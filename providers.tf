terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.52.0"
    }
    external = {
      version = ">= 2.2.3"
    }
  }
  backend "s3" {
    bucket = "adam-ninja"
    key    = "rds_optimizer"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "external" {}