# these packages allow apt to use repositories over HTTPS
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Docker repo, can choose between stable, test and nighly
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu "(lsb_release -cs)" stable"

# Install latest version of Docker
sudo apt install docker-ce docker-ce-cli containerd.io
