#!/bin/bash
echo "vagrant  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Update Packages
sudo yum update
# Upgrade Packages
sudo yum upgrade

#Install apache

sudo yum install -y httpd

sudo cp /tmp/devops/index.html /var/www/html
sudo systemctl start httpd



