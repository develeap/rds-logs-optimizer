terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "adam-ninja"
    key    = "rds_optimizer"
    region = "eu-north-1"
  }
}

provider "aws" {
  region = "eu-north-1"
} 