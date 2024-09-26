#!/bin/bash

destination_dir="/" # path to backup
source_dir="/home/mesh/dir1" # source dir to backup
Date=$(date +'%Y-%m-%d_%H-%M-%S') # Exact time of day
expire_day=7


email="" #write your own email

if tar zcvf "backup($source_dir/$Date)".tar.gz: then
	echo "$(date)->backup succeede"
	echo "backup completely succees $source_dir" | mail -s $email

else
	echo"$(date)->backup not sueccesd"
	echo"backup not complete" | mail -s $email

	exit 1 

fi

# find the file that older than 7 day
find "$destination_dir" -name "*.tar.gz" -type f -mtime +$expire_day -exec rm {}\;


# create cron for automatied script
# first ---->  corn -e
# then add time(this script run every 12hours daily)
# 0 */12 * * * ./backup_system.sh 
