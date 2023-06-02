#! /bin/bash
set -e

db_name=$1
db_host=$2
db_user=$3
db_pwd=$4
auth_db=$5
date_now=$(date +%Y%m%d-%H%M%S)
dir_name=/backup-tools/bak/$db_name-$date_now

echo "backup start"
mkdir -p $dir_name&&
/backup-tools/mongo-tools/bin/mongodump -h$db_host -u$db_user -p$db_pwd --authenticationDatabase $auth_db -d $db_name -o $dir_name &&
echo "backup finish"
echo "upload start"
/backup-tools/coscli cp $dir_name cos://apm-static-resources-1307155645/mongo-backup/ -r &&
echo "upload finish"
