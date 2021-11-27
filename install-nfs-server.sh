#!/bin/bash
echo "###############################"
echo "[Task 1] Installation des NFS-utils"
echo "###############################"
yum install nfs-utils -y 

echo "###############################"
echo "[Task 2] Creation dossier de partage"
echo "###############################"
mkdir /var/nfs-partage
chmod -R 775 /var/nfs-partage
chown nfsnobody:nfsnobody /var/nfs-partage
usermod -aG nfsnobody vagrant

echo "###############################"
echo "[Task 3] Start & Enable NFS Services"
echo "###############################"
systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap

echo "###############################"
echo "[Task 4] partage du dossier  /var/nfs-partage "
echo "###############################"
echo "/var/nfs-partage    172.15.20.0/24(rw,sync,no_root_squash,no_all_squash)" >> /etc/exports

echo "###############################"
echo "[Task 5] redemarage du serveur NFS"
echo "###############################"
systemctl restart nfs-server