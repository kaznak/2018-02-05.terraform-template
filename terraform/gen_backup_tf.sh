#!/bin/bash -e

stime=$(TZ="Asia/Tokyo" date +%Y%m%d%H%M%S%Z)

# exec 3>&2
exec 3>/dev/null

timestamp="${1:-"$stime"}"

cat backup.tf_template	|
    sed -e "s/%TIMESTAMP%/$timestamp/g" 	|
    tee backup_$timestamp.tf	>&3

terraform fmt

echo backup_$timestamp.tf

exit 0
