#!/bin/bash

DATETIME=`date +%b-%d-%y`

webserv="http://ec2-13-126-4-143.ap-south-1.compute.amazonaws.com/"

Keyword="Hello World" # enter the keyword for test content

if curl -s "$webserv" | grep "$keyword"
then
    # if the keyword is in the conent
    echo " the website is working fine"| curl --head "$webserv" > $DATETIME.txt
    # upload txt to s3
    aws s3 cp $DATETIME.txt s3://bucket-yasith/
else
    echo "Error" > error.txt
fi
