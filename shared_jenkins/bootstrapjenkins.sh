echo "vagrant  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Update Packages
sudo yum update
# Upgrade Packages
sudo yum upgrade

# Install git
sudo yum install -y git

# Install Jenkins
sudo yum install -y wget
sudo yum install -y dnf
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install epel-release java-11-openjdk-devel
sudo yum install jenkins
sudo systemctl daemon-reload

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

# Install ansible
sudo yum -y install python3
sudo python3 -m pip install -U pip
sudo python3 -m pip install -U setuptools
sudo pip3 install --upgrade setuptools
sudo pip3 install --upgrade pip
sudo pip3 install ansible
sudo pip3 install docker


