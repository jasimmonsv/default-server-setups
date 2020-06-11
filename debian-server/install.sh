#!/bin/bash
#Shout out to preslavmihaylov for the idea

# apt repositories
## ppa
sudo add-apt-repository -yy universe

# repository keys
## chrome
wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | sudo apt-key add -
## Spideroak
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 573E3D1C51AE1B3D

# initial upgrade of system
sudo apt-get update -yy
sudo apt-get upgrade -yy
sudo apt-get dist-upgrade -yy

# Installations
## Essential
sudo apt-get install -yy vim
sudo apt-get install -yy vim-gui-common
sudo apt-get install -yy vim-runtime

sudo apt-get install -yy software-properties-common
sudo apt-get install -yy apt-transport-https
sudo apt-get install -yy ca-certificates
sudo apt-get install -yy curl
sudo apt-get install -yy sshd
sudo apt-get install -yy ufw
sudo apt-get install -yy gnupg-agent
sudo apt-get install -yy git
sudo apt-get install -yy tmux
sudo apt-get install -yy ctags
sudo apt-get install -yy xclip

## Programming Languages/Tools
sudo apt-get install -yy python
sudo apt-get install -yy python3
sudo apt-get install -yy python-dev
sudo apt-get install -yy python-pip
sudo apt-get install -yy python3-pip

# Docker
sudo apt-get install -yy docker-ce
sudo apt-get install -yy docker-ce-cli
sudo apt-get install -yy containerd.io

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.24.1/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose

# Cleanup
sudo apt-get autoremove -yy
