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
  delete_rule $line
done << EOF
$(fetch_rules $code)
EOF
