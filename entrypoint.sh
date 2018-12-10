#!/bin/sh

mv /main.tf /github/workspace

pwd

terraform init -var-file='/github/workspace/main.tf'
terraform plan

terraform apply