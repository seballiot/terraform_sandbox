provider "aws" {

  access_key                  = "fake"
  secret_key                  = "fake"
  region                      = "us-east-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3            = "http://s3.localhost.localstack.cloud:4566"
    dynamodb      = "http://localhost:4566"
  }

  default_tags {
    tags = {
      Environment = "Local"
      Service     = "LocalStack"
    }
  }
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "my-bucket"
}

resource "aws_dynamodb_table" "test_table" {
  name           = "my-test-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.test_bucket.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.test_table.name
}