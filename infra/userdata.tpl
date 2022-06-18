#!/bin/bash
sudo su -
apt update -y

curl -fsSL https://get.docker.com | sh
usermod -aG docker $USER
systemctl enable docker
systemctl restart docker
apt install docker-compose -y
apt install jo -y
apt install sysstat -y
docker run -it -p 80:80 $(IMAGE_NAME)
