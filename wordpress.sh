#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install php php-mysql php-cgi php-cli php-gd -y
wget https://wordpress.org/latest.zip
sudo mount 51.15.100.73:/mnt/nfs_share /var/www/html
sudo apt install unzip -y
unzip latest.zip
sudo cp -r wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo rm -rf /var/www/html/index.html
sudo apt install nfs-common -y
