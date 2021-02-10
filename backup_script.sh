#!/bin/bash
BACKUPTIME=`date +%b-%d-%y` #get the date and time
if tar -zcvf backup-$BACKUPTIME.tar.gz /var/log/* #make a tar file
then
        aws s3 cp backup-$BACKUPTIME.tar.gz s3://bucket-yasith/  #upload the tar file to aws S3 bucket
        echo "----Backup is successfil-----"
        echo mail -s "$BACKUPTIME Backup is successfil" beastfighter@gmail.com #send mail to team if the upload is successful 

else

        rm -rf backup-$BACKUPTIME.tar.gz  #if upload is not successful remove the relavant compress file
        echo mail -s "backup-$BACKUPTIME is not successful. Please check..." beastfighter@gmail.com #send email to team
fi
