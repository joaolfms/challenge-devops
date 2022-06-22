#!/bin/bash
sudo su -
apt update -y

curl -fsSL https://get.docker.com | sh
usermod -aG docker $USER
systemctl enable docker
systemctl restart docker
sudo apt install docker-compose -y
sudo docker-compose.yaml << EOF
version: '3.7'
services:
  nginx:
    image: '$IMAGE_NAME'
    volumes:
      - $PWD:/app

  node1:
    image: 'nginx'
    ports:
      - '80:80' 
    volumes:
      - $PWD:/usr/share/nginx/html:ro
EOF
sudo docker-compose up -d