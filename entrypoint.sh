#!/bin/sh

mv /main.tf /github/workspace

terraform init 

terraform plan

terraform apply