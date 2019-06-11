#!/bin/bash
set -eu

. usage

create_rule () {
  code=$1
  no=$(printf "%02d" $2)
  ranges=$3
  rule="reject-${code}-${no}"

  gcloud compute firewall-rules create ${rule} \
    --priority 10 \
    --action deny \
    --rules all \
    --source-ranges ${ranges} \
    --target-tags ${rule} \
    --verbosity error \
    --quiet
}


code=$1
url="https://ipv4.fetus.jp/${code}.txt"

max=255
i=0
count=0
ips=""

while read -r line
do
  ips="${ips},${line}"
  i=$(( i + 1 ))
  if [[ $i -gt $max ]]; then
    count=$(( count + 1  ))
    create_rule $code $count ${ips#,}
    ips=""
    i=0
  fi
done << EOF
$(curl -s $url | grep -v -e '^#' | grep -v -e '^\s*$')
EOF

count=$(( count + 1  ))
create_rule $code $count ${ips#,}

