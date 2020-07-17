#!/bin/sh 
ssh ubuntu@172.31.22.31
service nagios status | grep 'active (running)' > /dev/null 2>&1
if [ $? != 0 ]
then
        sudo service nagios stop > /dev/null
fi
