#!/usr/bin/env fish

# these packages allow apt to use repositories over HTTPS
sudo apt install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# add Docker GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


sudo apt-get update

# Install the latest version of Docker
sudo apt install docker-ce docker-ce-cli containerd.io
