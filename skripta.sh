#!/bin/bash
mkdir Desktop
mkdir Documents
mkdir Downloads
mkdir Pictures
mkdir Videos
for i in {1..5}
do
   mkdir mapa$i
done
wget https://raw.githubusercontent.com/CallMeRyax/naloga6/main/uporabniki.txt
readarray -t local < uporabniki.txt
for i in {0..4}
do
  useradd -m -s /bin/bash ${local[i]}
  usermod -a -G sudo ${local[i]}
 done
apt-get -y update
apt-get -y upgrade
apt-get -y install git-all
apt-get -y install ufw
apt-get -y install nginx
apt-get -y install net-tools
apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg	
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get -y update
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
echo KONEC SKRIPTE
