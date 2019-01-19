#!/bin/bash

set -eu

terraform init aws-terraform/terraforming-pas
terraform destroy \
  -state terraform-state/terraform.tfstate \
  -state-out terraform-state-output/terraform.tfstate \
  -auto-approve