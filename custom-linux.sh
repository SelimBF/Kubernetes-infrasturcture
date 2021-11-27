#!/bin/bash
echo "###############################"
echo "[Task 1] installation packagage complémentaire mena w men ghady"
echo "###############################"
sudo yum install git vim nano wget bash-completion -y

echo "###############################"
echo "[Task 2] resolution DNS local /etc/hosts  el master w sone3o bch ye3rfo each other"
echo "###############################"
cat >> /etc/hosts <<EOF
172.15.20.10  master master.glag.local
172.15.20.101 worker1 worker1.glag.local
172.15.20.102 worker2 worker2.glag.local
172.15.20.103 worker3 worker3.glag.local
EOF

echo "###############################"
echo "[Task 3] enable SSH Password Authentication a5i eli iji yod5ol ssh houwa quoi"
echo "###############################"
sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

echo "###############################"
echo "[Task 4] reload SSHd bch njmo naccedo"
echo "###############################"
sudo systemctl reload sshd

echo "###############################"
echo "[Task 5 w nos] Password root = root hawino fibelkom"
echo "###############################"
echo "root" | passwd --stdin root 