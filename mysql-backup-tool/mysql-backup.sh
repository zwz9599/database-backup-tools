#! /bin/bash
set -e

backup_name=$1
env_name=$2
mysql_host=$3
mysql_user=$4
mysql_pwd=$5
mysql_database=$6
mysql_tables=$7
date_now=$(date +%Y%m%d-%H%M%S)
echo "backup start"
mkdir /backup-tools/bak
mysqldump --host=$mysql_host -u$mysql_user -p$mysql_pwd  $mysql_database --no-create-db --set-gtid-purged=OFF --complete-insert --single-transaction --quick --no-autocommit --tables $( mysql -h$mysql_host -u$mysql_user -p$mysql_pwd  $mysql_database -Bse "$mysql_tables")| sed '/^USE/d'  > /backup-tools/bak/$env_name-$mysql_database-$backup_name-$date_now.sql && tar -zcvPf /backup-tools/bak/$env_name-$mysql_database-$backup_name-$date_now.tar /backup-tools/bak/$env_name-$mysql_database-$backup_name-$date_now.sql 
echo "backup finish"
echo "upload start"
/backup-tools/coscli   cp /backup-tools/bak/$env_name-$mysql_database-$backup_name-$date_now.tar  cos://apm-static-resources-1307155645/mysql-backup/ &&
echo "upload finish"
