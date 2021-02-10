#!/bin/bash
BACKUPTIME=`date +%b-%d-%y`
if tar -zcvf backup-$BACKUPTIME.tar.gz /var/log/*
then
        aws s3 cp backup-$BACKUPTIME.tar.gz s3://bucket-yasith/
        echo "----Backup is successfil-----"
        #echo mail -s "$BACKUPTIME Backup is successfil" beastfighter@gmail.com

else

        rm -rf backup-$BACKUPTIME.tar.gz
        echo mail -s "backup-$BACKUPTIME is not successful. Please check..." beastfighter@gmail.com
fi
