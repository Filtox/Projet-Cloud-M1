#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install php php-mysql php-cgi php-cli php-gd -y
sudo apt install unzip -y
sudo apt install nfs-common -y
sudo mount 51.15.100.73:/mnt/nfs_share /var/www/html
wget https://wordpress.org/latest.zip
unzip latest.zip
sudo cp -r wordpress/* /var/www/html/
sudo chmod -R 755 /var/www/html/
sudo rm -rf /var/www/html/index.html
sudo touch /etc/rc.local
sudo echo "#!/bin/bash -e" >> /etc/rc.local
sudo echo "sudo mount 51.15.100.73:/mnt/nfs_share /var/www/html" >> /etc/rc.local
sudo echo "exit 0" >> /etc/rc.local
chown root:root /etc/rc.local
chmod 700 /etc/rc.local
