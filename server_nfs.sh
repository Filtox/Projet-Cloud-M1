#!/bin/bash
sudo apt update
sudo apt install nfs-kernel-server
sudo mkdir -p /mnt/nfs_share
sudo chown -R nobody:nogroup /mnt/nfs_share/
sudo chmod 777 /mnt/nfs_share/
sudo nano /etc/exports
    /mnt/nfs_share IP_WORPDRESS_1/24(rw,sync,no_subtree_check)
    /mnt/nfs_share IP_WORPDRESS_2/24(rw,sync,no_subtree_check)
sudo exportfs -a
sudo systemctl restart nfs-kernel-server
sudo ufw allow from IP_WORPDRESS_1/24 to any port nfs
sudo ufw allow from IP_WORPDRESS_2/24 to any port nfs
sudo ufw enable