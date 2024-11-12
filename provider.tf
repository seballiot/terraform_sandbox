terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0" # using last minor version of 4.x
    }
  }
}

provider "aws" {
  access_key = "fake"
  secret_key = "fake"
  region     = var.aws_region

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3       = "http://s3.localhost.localstack.cloud:4566"
    dynamodb = "http://localhost:4566"
    lambda   = "http://localhost:4566"
  }

  default_tags {
    tags = {
      Environment = "Local"
      Service     = "LocalStack"
    }
  }
}