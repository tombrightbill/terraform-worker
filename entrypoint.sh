#!/bin/sh

mv /main.tf /github/workspace

cd /github/workspace

ls

echo $CF_WORKER

cd /github/

echo 'githubworkspace'

ls

terraform init

terraform plan

terraform apply