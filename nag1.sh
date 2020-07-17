#!/bin/sh 
service nagios status | grep 'active (running)' > /dev/null 2>&1

if [ $? != 0 ]
then
        sudo service nagios stop > /dev/null
fi
