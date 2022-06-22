#!/bin/bash
sudo su -
apt update -y

curl -fsSL https://get.docker.com | sh
usermod -aG docker $USER
systemctl enable docker
systemctl restart docker
sudo apt install docker-compose -y
docker run -d -v $PWD:/app joaolfms/monitor_sys:latest
docker run -d -p 80:80 -v $PWD:/usr/share/nginx/html nginx