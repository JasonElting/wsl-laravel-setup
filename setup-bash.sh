#!/bin/bash
sudo apt-get update -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y 
sudo apt-get install -y apache2 php7.1 php7.1-common php7.1-xml php7.1-curl php7.1-mcrypt php7.1-cli php7.1-mbstring php7.1-zip php7.1-mysql libapache2-mod-php7.1 build-essential mysql-server mysql-client
sed -i "s/test/$1/g" /etc/apache2/envvars
service apache2 restart
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa >/dev/null
cp ~/.ssh/id_rsa.pub "/mnt/c/Users/$1/Desktop/key.txt"