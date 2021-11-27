#!/bin/bash
echo "###############################"
echo "[Task 1] sysctl bridge"
echo "###############################"
sudo cat > /etc/sysctl.d/kubernetes.conf <<EOF
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF
sudo sysctl --system

echo "###############################"
echo "[Task 2] desactivation et off swap"
echo "###############################"
sudo sed -i '/swap/d' /etc/fstab
sudo swapoff -a

echo "###############################"
echo "[Task 3] desactivation et off firewalld"
echo "###############################"
sudo systemctl disable firewalld
sudo systemctl stop firewalld

echo "###############################"
echo "[Task 4] desactivation et off SELinux"
echo "###############################"
sudo sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux
sudo setenforce 0

echo "###############################"
echo "[Task 5] repository Kubernetes"
echo "###############################"
sudo cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

echo "###############################"
echo "[Task 6] installation Kubernetes"
echo "###############################"
sudo yum install kubeadm kubelet kubectl -y

echo "###############################"
echo "[Task 7] activation et on kubelet"
echo "###############################"
sudo systemctl enable kubelet
sudo systemctl start kubelet