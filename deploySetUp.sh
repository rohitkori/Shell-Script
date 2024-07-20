!/usr/bin/bash

# install nginx
sudo apt-get update
echo "Y" | sudo apt-get install nginx

# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh


# Execute the docker commands without sudo
sudo usermod -aG docker ${USER} # Note: have to login again, then only it will work

# install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# install certbot
sudo apt update
echo "yes" | sudo apt install snapd
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
