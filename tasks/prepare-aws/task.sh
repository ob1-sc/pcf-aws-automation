#!/bin/bash

set -eu

export ami=$(cat ami/ami)

terraform init aws-terraform/terraforming-pas

terraform plan \
  -state terraform-state/terraform.tfstate \
  -var "env_name=${ENV_NAME}" \
  -var "ops_manager_ami=${ami}" \
  -var "aws_access_key_id=${AWS_ACCESS_KEY_ID}" \
  -var "aws_secret_access_key=${AWS_SECRET_ACCESS_KEY}" \
  -var "access_key=${AWS_ACCESS_KEY_ID}" \
  -var "secret_key=${AWS_SECRET_ACCESS_KEY}" \
  -var "aws_region=${AWS_REGION}" \
  -var "region=${AWS_REGION}" \
  -var "availability_zones=[\"$AWS_AZ1\", \"$AWS_AZ2\", \"$AWS_AZ3\"]" \
  -var "aws_az1=${AWS_AZ1}" \
  -var "aws_az2=${AWS_AZ2}" \
  -var "aws_az3=${AWS_AZ3}" \
  -var "hosted_zone=${HOSTED_ZONE}" \
  -var "dns_suffix=${DNS_SUFFIX}" \
  -var "vpc_cidr=${VPC_CIDR}" \
  -var "rds_instance_count=0" \
  -var "ops_manager_vm=${OPS_MANAGER_VM}" \
  -out terraform.tfplan \
  aws-terraform/terraforming-pas

terraform apply \
  -state-out terraform-state-output/terraform.tfstate \
  terraform.tfplan
