#!/bin/bash
sudo apt update
sudo apt install apache2 -y
sudo apt install php php-mysql php-cgi php-cli php-gd -y
sudo apt install nfs-common -y
sudo mkdir /var/wwww
sudo mkdir /var/wwww/html
sudo mount 51.15.100.73:/mnt/nfs_share /var/www/html
sudo touch /etc/rc.local
sudo echo "#!/bin/bash -e" >> /etc/rc.local
sudo echo "sudo mount 51.15.100.73:/mnt/nfs_share /var/www/html" >> /etc/rc.local
sudo echo "exit 0" >> /etc/rc.local
chown root:root /etc/rc.local
chmod 700 /etc/rc.local
