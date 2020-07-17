#!/bin/sh 
#echo "hi world...." | sudo tee /home/ubuntu/kotresha/jai
#sudo service nagios status
ssh ubuntu@172.31.22.31 
'addr=$1
port=$2
user=$3
sed -i -e "s/\(address=\).*/\1$1/" \
-e "s/\(port=\).*/\1$2/" \
-e "s/\(username=\).*/\1$3/" /home/ubuntu/xyz.cfg'
#'sudo vi /etc/apache2/conf-available/nagios.conf'

#'cd /home/ubuntu/hiyan'
#'sudo touch sales.txt'"


