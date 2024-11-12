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

data "archive_file" "src_lambda" {
  type          = "zip"
  source_file   = "${path.root}/lambda_function.py"
  output_path   = "${path.root}/lambda_function.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "lambda_function.zip"
  source_code_hash = data.archive_file.src_lambda.output_base64sha256
  function_name    = "testLambda"
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.8"
  role             = "arn:aws:iam::000000000000:role/fake-role"
  timeout          = 10

  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.test_table.name
    }
  }
}