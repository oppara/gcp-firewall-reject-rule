#!/bin/bash
set -eu

usage () {
  cat << EOF
Usage:
  $0 instance_name  zone

Example:
  $0 web us-west1-b
EOF
}

if [[ $# -ne 2 ]]; then
  usage
  exit 1
fi

instance=$1
zone=$2
cwd=$(cd $(dirname $0) && pwd)

$cwd/lib/add-tags.sh ${instance} cn ${zone}
$cwd/lib/add-tags.sh ${instance} au ${zone}
