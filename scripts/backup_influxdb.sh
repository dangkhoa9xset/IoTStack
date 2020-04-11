#!/bin/bash

#first move the contents of the old backup out and clear the directory
echo "Moving old influxdb backups if they exist"
[ -d ~/IoTStack/backups/influxdb/db_old ] || sudo mkdir ~/IoTStack/backups/influxdb/db_old
sudo rm ~/IoTStack/backups/influxdb/db_old/* >/dev/null 2>&1
sudo mv ~/IoTStack/backups/influxdb/db/* ~/IoTStack/backups/influxdb/db_old/ >/dev/null 2>&1
#sudo rm ~/IoTStack/backups/influxdb/db/*

#execute the backup command
echo "backing up influxdb database"
docker exec influxdb influxd backup -portable /var/lib/influxdb/backup >/dev/null 2>&1
echo "influxdb backup complete"
