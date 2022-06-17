#!/bin/bash
sudo su -

curl -fsSL https://get.docker.com | sh
usermod -aG docker $USER
systemctl enable docker
systemctl restart docker
apt install docker-compose

echo "hello world" > index.html

docker run -d --rm --name=nginx -p 80:80 -v $PWD:/usr/share/nginx/html:ro nginx