#!/bin/sh

cd /github/home

echo '/github/home directory below'

ls

cd /github/workspace

echo '/github/home directory below'

ls

terraform init

terraform plan

terraform apply