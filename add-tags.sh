#!/bin/bash
set -eu

. usage-tags
. common


instance=$1
code=$2
zone=$3

tags=$(fetch_rule_string $code)

gcloud compute instances add-tags ${instance} \
    --zone ${zone} \
    --tags ${tags}

