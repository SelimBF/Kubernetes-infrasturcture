#!/bin/bash
echo "###############################"
echo "[Task 1] Installation des prerequis Docker"
echo "###############################"
sudo yum install yum-utils device-mapper-persistent-data lvm2 -y 

echo "###############################"
echo "[Task 2] Configuration du repository Docker"
echo "###############################"
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 

echo "###############################"
echo "[Task 3] installation Docker runtime"
echo "###############################"
sudo yum install docker-ce -y

echo "###############################"
echo "[Task 4] personalisation cgroupdriver=systemd"
echo "###############################"
sudo mkdir /etc/docker

# Set up the Docker daemon
sudo cat > /etc/docker/daemon.json <<EOF
{
  "exec-opts": ["native.cgroupdriver=systemd"],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "100m"
  },
  "storage-driver": "overlay2",
  "storage-opts": [
    "overlay2.override_kernel_check=true"
  ]
}
EOF

echo "###############################"
echo "[Task 5] Start & Enable Docker"
echo "###############################"
sudo systemctl start docker
sudo systemctl enable docker

echo "###############################"
echo "[Task 6] add vagrant user to docker group"
echo "###############################"
usermod -aG docker vagrant