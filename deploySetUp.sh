!/usr/bin/bash

# install nginx
sudo apt-get update
echo "Y" | sudo apt-get install nginx
echo "q" | sudo service nginx status

# install docker
sudo apt update
echo "Y" | sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo "yes" | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
echo "Y" | sudo apt install docker-ce
#echo "q" | sudo systemctl status docker

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
