#!/usr/bin/env bash
set -e
set -u
set -o pipefail
#set -x

# configure required vm extensions that cannot currently be configured via ops manager UI/config
om --env env/"${ENV_FILE}" -k curl --path /api/v0/staged/vm_extensions/web-lb-security-groups -x PUT -d \
  '{"name": "web-lb-security-groups", "cloud_properties": { "security_groups": ["web_lb_security_group", "vms_security_group"] }}'
om --env env/"${ENV_FILE}" -k curl --path /api/v0/staged/vm_extensions/ssh-lb-security-groups -x PUT -d \
  '{"name": "ssh-lb-security-groups", "cloud_properties": { "security_groups": ["ssh_lb_security_group", "vms_security_group"] }}'
om --env env/"${ENV_FILE}" -k curl --path /api/v0/staged/vm_extensions/tcp-lb-security-groups -x PUT -d \
  '{"name": "tcp-lb-security-groups", "cloud_properties": { "security_groups": ["tcp_lb_security_group", "vms_security_group"] }}'