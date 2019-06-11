#!/bin/bash
set -eu

. usage

delete_rule () {
  gcloud compute firewall-rules delete ${1} --quiet
}

rule="reject-${1}"

while read -r line
do
  delete_rule $line
done << EOF
$(gcloud compute firewall-rules list --format=json | jq -r '.[].name' | grep ${rule})
EOF
