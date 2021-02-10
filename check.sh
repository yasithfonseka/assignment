#!/bin/bash
if wget --spider -S "ec2-13-126-4-143.ap-south-1.compute.amazonaws.com" 2>&1 | grep -w "200\|301" ; then
    echo "Server is up"
else
    echo "Server is down. Wait till server is starting..."
    sudo systemctl start httpd
    sudo systemctl enable httpd
fi
