#!/bin/bash

sudo apt-get update -y

sudo apt-get install libpam0g-dev -y

cd 

cd /etc/pam.d

sudo chmod 777 deepin_pam_unix
sudo sed -i '1i\auth sufficient sensepam.so' deepin_pam_unix
sudo sed -i '2i\account sufficient sensepam.so' deepin_pam_unix

cd 
cd /usr/share/dde-session-ui
sudo chmod  777 dde-session-ui.conf
sudo sed -i 's/false/true/g' dde-session-ui.conf

cd 
cd Downloads
sudo wget -c https://sense-source.oss-cn-shanghai.aliyuncs.com/linux_pam/openssl-1.1.1k.tar.gz
sudo wget -c https://sense-source.oss-cn-shanghai.aliyuncs.com/linux_pam/sensepam.c
sudo chmod 777 openssl-1.1.1k.tar.gz
sudo chmod 777 sensepam.c
tar xzvf openssl-1.1.1k.tar.gz

cd ~/Downloads/openssl-1.1.1k/

./config

make 

sudo make install

cd 

gcc -fPIC -fno-stack-protector -c Downloads/sensepam.c -lssl -lcrypto

sudo ld -x --shared -o /lib/security/sensepam.so    sensepam.o -lssl -lcrypto
#sudo rm ~/.local/share/keyrings/login.keyring
sudo rm Downloads/sensepam.c
sudo rm sensepam.o
