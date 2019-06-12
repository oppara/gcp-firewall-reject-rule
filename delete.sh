#!/bin/bash
set -eu

. usage-firewall
. common

delete_rule () {
  gcloud compute firewall-rules delete ${1} --quiet
}

code="${1}"

while read -r line
do
  if [[ -n $line ]]; then
    delete_rule $line
  fi
done << EOF
$(fetch_rules $code)
EOF
