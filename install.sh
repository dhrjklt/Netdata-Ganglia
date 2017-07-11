#!/bin/bash

# clean the yum cache 
yum clean all 
#install preliminary packages
yum install wget curl git fail2ban bc httpd-tools -y
#check the version
uname -m && cat /etc/centos-release
#use the version number to install the correct epel-repo
wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
yum install epel-release-latest-6.noarch.rpm -y 
#install nginx and apache
RUNLEVEL=1 yum install httpd nginx -y 
#replace the port 80 to 8000
value=$( grep -icw "Listen 80" /etc/httpd/conf/httpd.conf )
if  [ $value -eq 1 ]
then 
        sed -i s/80/8000/g /etc/apache2/ports.conf
        echo "Port set to 8000"
else 
 
     echo "Port is different"
fi 
#letsencrypt ssl installation
git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt 
/opt/letsencrypt/letsencrypt-auto certonly 
crontab -l >> mycrontab
#auto update of the certifacte, error logs will be in /var/log/letsencrypt.log 
echo "00 1 * * 1 /opt/letsencrypt/letsencrypt-auto renew >> /var/log/letsencrypt.log" >> mycrontab
crontab mycrontab 
rm mycrontab 

