#!/bin/bash
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Pictures
mkdir Videos
for l in {1..5}
do
  mkdir mapa$l
done
readarray -t local < uporabniki.txt
for i in {0..4}
do
  useradd -m -s /bin/bash ${local[i]}
  usermod -a -G sudo ${local[i]}
 done
apt-get update && apt-get upgrade
apt-get install git-all
apt-get install ufw
apt-get install nginx
apt-get install net-tools
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg	
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
