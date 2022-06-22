#!/bin/bash
sudo su -
apt update -y

curl -fsSL https://get.docker.com | sh
usermod -aG docker $USER
systemctl enable docker
systemctl restart docker
sudo apt install docker-compose -y
touch /home/ubuntu/docker-compose.yaml