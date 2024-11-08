## Terraform sandbox with LocalStack

A Terraform configuration using LocalStack to simulate AWS services locally.

### Project Structure
- `main.tf` : Terraform configuration for AWS resources
- `docker-compose.yml` : configures LocalStack to run AWS services locally

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

- Check ressources existence
```
aws --endpoint-url=http://localhost:4566 s3 ls
aws --endpoint-url=http://localhost:4566 dynamodb list-tables
aws --endpoint-url=http://localhost:4566 dynamodb scan --table-name my-test-table
```

### Clean
```
terraform destroy -auto-approve && docker-compose down
```
