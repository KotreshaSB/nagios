#!/bin/sh
 ssh ubuntu@172.31.22.31
 
 sudo service nagios start
 systemctl enable nagios
