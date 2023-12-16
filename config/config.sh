#!/bin/bash

sudo su

# Instal git
yum install -y git

git clone https://github.com/CTFd/CTFd.git
cd CTFd

# Manual:
# Update conf/nginx ctf:xxx  to "0.0.0.0:xxx""

# Configure docker
yum install -y docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

# Install docker-compose
sudo yum update -y 
sudo amazon-linux-extras install docker 
sudo yum install docker 
sudo service docker start 
sudo usermod -a -G docker ec2-user 

sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose version

# Run solution
/usr/local/bin/docker-compose up

# Manual:
# Go to the browser, access the CTF page and import the backup data
# located at "config/backup_data_ctf.zip"