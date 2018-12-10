#!/bin/sh

mv /main.tf /github/workspace

cd /github/workspace

export $CF_WORKER=hello-world.js


terraform init

terraform plan

terraform apply