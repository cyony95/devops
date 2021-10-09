#!/bin/bash
echo "vagrant  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Update Packages
sudo yum update
# Upgrade Packages
sudo yum upgrade

# Basic Linux Stuff
sudo yum install -y git

# Install Docker
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
				  
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
	
sudo yum install -y docker-ce docker-ce-cli containerd.io
sudo systemctl start docker

# install ansible
sudo yum -y install python3
sudo python3 -m pip install -U pip
sudo python3 -m pip install -U setuptools
sudo pip3 install --upgrade setuptools
sudo pip3 install --upgrade pip
sudo pip3 install ansible
sudo pip3 install docker

