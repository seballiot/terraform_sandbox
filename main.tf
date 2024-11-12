resource "aws_s3_bucket" "test_bucket" {
  bucket = "my-bucket"
}

resource "aws_dynamodb_table" "test_table" {
  name         = "my-test-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
