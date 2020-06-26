#!/usr/bin/env bash

export LC_ALL="en_US.UTF-8"
export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password password"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password password"
sudo apt-get update -y 
sudo apt-get install -y mysql-server

sudo systemctl restart mysql

# allow remote access
mysql -u root -ppassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"

# flush
mysql -u root -ppassword -e "FLUSH PRIVILEGES;"

# restart
#sudo service mysqld restart
sudo systemctl restart mysql

# set to autostart
#sudo chkconfig mysqld on



# Variables
#DBHOST=localhost
#DBNAME=dbname
#DBUSER=dbuser


#cho -e "\n--- Updating packages list ---\n"
#sudo apt-get -qq update

# MySQL setup for development purposes ONLY
#echo -e "\n--- Install MySQL specific packages and settings ---\n"
#export LC_ALL="en_US.UTF-8"
#debconf-set-selections <<< "mysql-server mysql-server/root_password password $DBPASSWD"
#debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DBPASSWD"

#echo -e "\n--- Setting up our MySQL user and db ---\n"
#mysql -uroot -p$DBPASSWD -e "CREATE DATABASE $DBNAME" >> /vagrant/vm_build.log 2>&1
#mysql -uroot -p$DBPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASSWD'" > /vagrant/vm_build.log 2>&1
