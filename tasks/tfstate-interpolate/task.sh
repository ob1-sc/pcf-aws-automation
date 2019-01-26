#!/usr/bin/env bash
set -e
set -u
set -o pipefail
#set -x

files=$(cd files && find $INTERPOLATION_PATH -type f -name '*.yml' -follow)

echo $files

for file in $files; do
  echo "interpolating files/$file"
  mkdir -p interpolated-files/"$(dirname "$file")"
  # credhub interpolate --prefix "$PREFIX" --file files/"$file" > interpolated-files/"$file"
done