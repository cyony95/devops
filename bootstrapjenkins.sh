#!/bin/bash

echo "vagrant  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Update Packages
sudo yum update
# Upgrade Packages
sudo yum upgrade

# Install git
sudo yum install -y git

#Install Docker
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

# Install ansible
sudo yum -y install python3
sudo python3 -m pip install -U pip
sudo python3 -m pip install -U setuptools
sudo pip3 install --upgrade setuptools
sudo pip3 install --upgrade pip
sudo pip3 install ansible
sudo pip3 install docker

# Install Jenkins
sudo yum install -y wget
sudo yum install -y java-1.8.0-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
curl -LO 'https://rpmfind.net/linux/epel/7/x86_64/Packages/d/daemonize-1.7.7-1.el7.x86_64.rpm'
sudo rpm -Uvh ./daemonize-1.7.7-1.el7.x86_64.rpm
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install -y jenkins java-1.8.0-openjdk-devel
sudo systemctl start jenkins
sudo systemctl enable jenkins
