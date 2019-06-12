#!/bin/bash
set -eu

cwd=$(cd $(dirname $0) && pwd)
. $cwd/common


instance=$1
code=$2
zone=$3

tags=$(fetch_rule_string $code)

gcloud compute instances add-tags ${instance} \
    --zone ${zone} \
    --tags ${tags}

