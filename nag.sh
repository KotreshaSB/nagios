#!/bin/sh
 apt-get update
 apt-get install wget build-essential unzip openssl libssl-dev
 apt-get install apache2 php libapache2-mod-php php-gd libgd-dev 
 adduser nagios_user
 groupadd nagcmd
 usermod -a -G nagcmd nagios_user
 usermod -a -G nagcmd www-data
cd /opt
 wget https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-4.4.3/nagios-4.4.3.tar.gz
tar xzf nagios-4.4.3.tar.gz
cd nagios-4.4.3
 ./configure --with-command-group=nagcmd
 make all
 make install
 make install-init
 make install-daemoninit
 make install-config
 make install-commandmode
 make install-exfoliation
 cp -R contrib/eventhandlers/ /usr/local/nagios/libexec/
 chown -R nagios:nagios /usr/local/nagios/libexec/eventhandlers
 vim /etc/apache2/conf-available/nagios.conf
 htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
cd /opt
wget http://www.nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
tar xzf nagios-plugins-2.2.1.tar.gz
cd nagios-plugins-2.2.1
 ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
 make
 make install
/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
service nagios start
 systemctl enable nagios
