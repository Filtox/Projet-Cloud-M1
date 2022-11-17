#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install php php-mysql php-cgi php-cli php-gd -y
sudo wget https://wordpress.org/latest.zip
sudo apt install unzip -y
sudo unzip latest.zip
sudo cp -r wordpress/* /var/www/html/
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo rm -rf /var/www/html/index.html
sudo systemctl restart apache2
sudo apt install nfs-common -y
sudo mount IP_SERVEUR_NTFS:/mnt/nfs_share /var/www/html