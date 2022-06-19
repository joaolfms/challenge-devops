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
docker run -d -v ./:/urs/share/nginx/html -p 80:80 joaolfms/monitor_sys:c9d9675a8ef65b584252803b1f8bf74b6fa1ab82
docker-compose up -d