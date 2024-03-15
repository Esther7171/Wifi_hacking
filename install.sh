#!/bin/bash
cd Wifi_hacking
tar -xjvf compat-wireless-2010-06-28.tar.bz2 
cd compat-wireless-2010-06-28/    
sudo make unload 
sudo make load 
sudo apt update -y 
cd /home/$USER/
sudo apt install dkms git -y
sudo apt install build-essential libelf-dev linux-headers-$(uname -r) -y
sudo apt install -y linux-headers*
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl88*
sudo make dkms_install -y
lsusb
echo -e "\033[1;31m All Done\033[0m"
echo ""
echo -e "\033[1;31m Restarting Your system \033[0m"
sleep 1s
init 6
