## Terraform sandbox with LocalStack

A Terraform configuration using LocalStack to simulate AWS services locally.

### Project Structure
- `main.tf` : Terraform configuration for AWS resources
- `docker-compose.yml` : configures LocalStack to run S3 locally

### Requirements

- Docker
- `terraform` CLI
- `aws` CLI

Note : the *access_key* and *secret_key* in provider are set to fake values because of LocalStack.

### Run

- Deploy LocalStack
```
docker-compose up -d
```

- Deploy with terraform
```
terraform init
terraform validate
terraform plan
terraform apply -auto-approve
```

- Check S3 bucket existence
```
aws --endpoint-url=http://localhost:4566 s3 ls
```

### Clean
```
terraform destroy && docker-compose down
```
