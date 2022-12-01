sudo apt update
sudo apt install apache2 -y
sudo apt install php php-mysql php-cgi php-cli php-gd -y
sudo apt install nfs-common -y
sudo mkdir /var/wwww
sudo mkdir /var/wwww/html
sudo mount 51.15.100.73:/mnt/nfs_share /var/www/html
