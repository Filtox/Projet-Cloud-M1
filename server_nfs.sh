#!/bin/bash
sudo apt update
sudo apt install nfs-kernel-server -y
sudo mkdir -p /mnt/nfs_share
sudo chown -R nobody:nogroup /mnt/nfs_share/
sudo chmod 777 /mnt/nfs_share/
sudo echo "/mnt/nfs_share wp1.pierreds.studio/24(rw,sync,no_subtree_check)" >> /etc/exports
sudo echo "/mnt/nfs_share wp2.pierreds.studio/24(rw,sync,no_subtree_check)" >> /etc/exports
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
sudo ufw allow from wp1.pierreds.studio/24 to any port nfs
sudo ufw allow from wp2.pierreds.studio/24 to any port nfs
sudo ufw allow 22
sudo ufw enable