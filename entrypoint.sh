#!/bin/sh

mv /main.tf /github/workspace

terraform init -var-file='/github/workspace/main.tf'
terraform plan

terraform apply