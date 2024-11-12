output "s3_bucket_name" {
  description = "Bucket name"
  value       = aws_s3_bucket.test_bucket.bucket
}

output "dynamodb_table_name" {
  description = "Table name"
  value       = aws_dynamodb_table.test_table.name
}