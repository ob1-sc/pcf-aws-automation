#!/usr/bin/env bash
set -e
set -u
set -o pipefail
#set -x

# setup texplate
texplate_bin=$(ls ./texplate/texplate*)
chmod +x $texplate_bin

# setup jq
jq_bin=$(ls ./jq/jq*)
chmod +x $jq_bin

# get all the files to interpolate
files=$(cd files && find $INTERPOLATION_PATH -type f -name '*.yml' -follow)

for file in $files; do
  echo "interpolating files/$file"
  mkdir -p interpolated-files/"$(dirname "$file")"
  $texplate_bin execute files/"$file" -f <($jq_bin -e --raw-output '.modules[0].outputs | map_values(.value)' ./tf_state/terraform.tfstate) -o yaml > interpolated-files/"$file"
done