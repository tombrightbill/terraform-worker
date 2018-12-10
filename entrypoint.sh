#!/bin/sh

mv /main.tf /github/workspace

cd /github/workspace
ls


terraform init

terraform plan

terraform apply