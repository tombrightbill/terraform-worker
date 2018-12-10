#!/bin/sh

mv /main.tf /github/workspace

pwd

ls

echo 'moving up a directory'

cd ..

pwd

ls

terraform init -var-file='/github/workspace/main.tf'
terraform plan

terraform apply