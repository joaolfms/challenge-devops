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
docker run -d -v ./:/urs/share/nginx/html -p joaolfms/monitor_sys:6be061433738ff570c00333d28d4b13ed3fb3a4a
docker-compose up -d