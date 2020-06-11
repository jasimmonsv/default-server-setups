#!/bin/bash
#Shout out to preslavmihaylov for the idea

# apt repositories
## ppa
sudo add-apt-repository -yy universe

# repository keys
sudo apt-get install -yy gnupg-agent \
    curl \
    sed
## Spideroak
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 573E3D1C51AE1B3D

# initial upgrade of system
sudo apt-get update -yy
sudo apt-get upgrade -yy
sudo apt-get dist-upgrade -yy

# Configs
sudo sed -i s/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/ /etc/systemd/logind.conf

# Installations
## Essential
sudo apt-get install -yy vim \
    vim-gui-common \
    vim-runtime

sudo apt-get install -yy software-properties-common \
    apt-transport-https \
    ca-certificates \
    sshd \
    ufw \
    git \
    tmux \
    ctags \
    xclip

## Programming Languages/Tools
sudo apt-get install -yy python
sudo apt-get install -yy python3
sudo apt-get install -yy python-dev
sudo apt-get install -yy python-pip
sudo apt-get install -yy python3-pip

# Cleanup
sudo apt-get autoremove -yy
