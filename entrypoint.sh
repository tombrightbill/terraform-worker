#!/bin/sh

mv /main.tf /github/workspace

echo $CF_WORKER

ls

terraform init

terraform plan

terraform apply --auto-approve