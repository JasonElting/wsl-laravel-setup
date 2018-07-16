#!/bin/bash

# PHP installation
sudo apt-get install -y python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get -y dist-upgrade
sudo apt-get install -y php7.1 php7.1-cli php7.1-common php7.1-mbstring php7.1-gd php7.1-mysql php7.1-mcrypt php7.1-zip php7.1-xml
sudo apt-get install --fix-missing

# NodeJS installation
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash –
sudo apt-get install -y nodejs

# Composer installation
cd ~;
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer

# SSH key
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa >/dev/null
cp ~/.ssh/id_rsa.pub "/mnt/c/Users/$1/Desktop/key.txt"

# MySQL installation
DEBIAN_FRONTEND=noninteractive sudo -E apt-get -q -y install mysql-server
sudo service mysql start
#sudo mysql_secure_installation

# NVM installation
sudo apt-get install -y build-essential
sudo apt-get install -y libssl-dev
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
nvm install --lts
nvm use --lts

# Laravel setup
composer global require “laravel/installer”
export PATH=~/.config/composer/vendor/bin:$PATH 
source ~/.profile

sudo apt-get
npm install -g webpack
npm install -g bower
