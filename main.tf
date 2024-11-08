provider "aws" {

  access_key                  = "fake"
  secret_key                  = "fake"
  region                      = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3             = "http://s3.localhost.localstack.cloud:4566"
  }

  default_tags {
    tags = {
      Environment = "Local"
      Service     = "LocalStack"
    }
  }
}

resource "aws_s3_bucket" "test-bucket" {
  bucket = "my-bucket"
}