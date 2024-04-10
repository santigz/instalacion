#! /bin/bash

# Add Docker's official GPG key:
apt-get update
apt-get install ca-certificates curl wget gnupg git git-gui rar openjdk-21-jdk-headless maven net-tools openssl terminator virtualbox -y

apt remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku thunderbird -y

snap install eclipse --classic
snap install netbeans --classic
snap install sublime-text --classic
snap install android-studio --classic
snap install intellij-idea-community --classic
snap install dbeaver-ce
snap install postman
sudo snap install drawio
snap install --classic code

# DOCKER

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose -y

addgroup docker
whoami | xargs -I % sudo adduser % docker


# CHROME

apt install libxss1 libappindicator1 libindicator7 -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome*.deb -y
