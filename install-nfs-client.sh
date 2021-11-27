#!/bin/bash
echo "###############################"
echo "[Task 1] Installation des NFS-utils"
echo "###############################"
yum install nfs-utils -y 

echo "###############################"
echo "[Task 2] Creation dossier de montage"
echo "###############################"
mkdir -p /mnt/nfs/var/nfs-partage

echo "###############################"
echo "[Task 3] montage du dossier partager"
echo "###############################"
mount -t nfs 172.15.20.10:/var/nfs-partage /mnt/nfs/var/nfs-partage/
echo "172.15.20.10:/var/nfs-partage    /mnt/nfs/var/nfs-partage   nfs defaults 0 0" >> /etc/fstab