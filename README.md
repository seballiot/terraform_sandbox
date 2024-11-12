## Terraform sandbox with LocalStack

A Terraform configuration using LocalStack to simulate AWS services locally.

### Requirements

- docker
- terraform cli
- aws cli

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

- Lambda func testing
```
payload=`echo '{"a": 1}' | openssl base64`
aws --endpoint-url=http://localhost:4566 lambda invoke \
    --log-type Tail \
    --function-name testLambda \
    --payload "$payload" \
    --cli-binary-format raw-in-base64-out /dev/stdout
```
- Watch logs
```
aws --endpoint-url=http://localhost:4566 logs tail /aws/lambda/testLambda --follow
```

### Clean
```
terraform destroy -auto-approve && docker-compose down
```
