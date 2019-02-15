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
  -var "aws_session_token=${AWS_SESSION_TOKEN}" \
  -var "access_key=${AWS_ACCESS_KEY_ID}" \
  -var "secret_key=${AWS_SECRET_ACCESS_KEY}" \
  -var "session_token=${AWS_SESSION_TOKEN}" \
  -var "aws_region=${AWS_REGION}" \
  -var "region=${AWS_REGION}" \
  -out terraform.tfplan \
  aws-terraform

terraform apply terraform.tfplan
