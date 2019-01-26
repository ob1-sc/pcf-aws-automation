#!/usr/bin/env bash
set -e
set -u
set -o pipefail
#set -x

# Get the current directory that the script is running in
export SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Hello World"
echo "Script Dir: $SCRIPT_DIR"