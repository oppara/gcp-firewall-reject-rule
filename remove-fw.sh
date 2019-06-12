#!/bin/bash
set -eu

cwd=$(cd $(dirname $0) && pwd)

$cwd/lib/delete.sh cn
$cwd/lib/delete.sh au
