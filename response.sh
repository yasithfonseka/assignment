#!/bin/bash

DATETIME=`date +%b-%d-%y` #get date 

webserv="http://ec2-13-126-4-143.ap-south-1.compute.amazonaws.com/" #created public server

Keyword="Hello World" # enter the keyword for test content   #content of the server

if curl -s "$webserv" | grep "$keyword" #check the content of the web server
then
    # if the keyword is in the conent
    echo " the website is working fine"| curl --head "$webserv" > $DATETIME.txt
    # upload txt to s3
    aws s3 cp $DATETIME.txt s3://bucket-yasith/
else
    echo "Error" > error.txt
fi
