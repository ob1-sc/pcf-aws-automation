#!/usr/bin/env bash
set -e
set -u
set -o pipefail
#set -x

terraform init aws-terraform

terraform plan \
  -var "env_name=${ENV_NAME}" \
  -var "aws_access_key_id=${AWS_ACCESS_KEY_ID}" \
  -var "aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}" \
  -var "access_key=${AWS_ACCESS_KEY_ID}" \
  -var "secret_key=${AWS_SECRET_ACCESS_KEY}" \
  -var "aws_region=${AWS_REGION}" \
  -var "region=${AWS_REGION}" \
  aws-terraform

terraform apply
