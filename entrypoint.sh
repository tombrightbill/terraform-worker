#!/bin/sh

mv /main.tf /github/workspace

cd /github/workspace

ls

echo $CF_WORKER

terraform init

terraform plan

terraform apply