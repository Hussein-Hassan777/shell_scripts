#!/bin/bash

if ! rm -r /tmp/* 2> /dev/null
then
echo "removing failed"
else
echo "removing succeeded"
fi

archiving(){
mkdir -p ~/backups/ 2>/dev/null
tar -cvf ~/backups/backups_home_$(date +%y%m%d).tar ~/Documents ~/Pictures 2>/dev/null
}

if ! archiving
then
echo "archiving failed"
else
echo "archiving succeeded"
fi

echo "Backup completed on $(date)" >> ~/backups/backup_log.txt

deleting(){
find ~/backups/ -type f -mtime +7 -delete
}

if ! deleting
then
echo "deleting failed"
else
echo "deleting succeeded"
fi
