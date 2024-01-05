#!/bin/bash
bold="\e[1;32m"        # 1               [ ✔ ]
italic="\e[3;32m"      # 3               [ X ]
underline="\e[4;32m"   # 4
blink="\e[5;32m"       # 5
highlight="\e[7;32m"   # 7
ending="\e[0m"         # 0
Red='\033[1;31m'          # Red   echo -e "\033[1;35m  \033[0m"
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'          # light blue
reset='\033[0m'
echo -e "$Red EXTRACTING DRIVERS $reset" 
sudo apt-get update -y
cd /home/$USER/
cd /home/$USER/kali-wifi-driver-and-wifi-hacking
tar -xjvf compat-wireless-2010-06-28.tar.bz2 
cd compat-wireless-2010-06-28/
echo "LOADING"
sudo make unload 
sudo make load 
iwconfig
echo "INSTALL DRIVERS FOR TP LINK"
cd /home/$USER/
sudo apt install dkms git -y
sudo apt install build-essential libelf-dev linux-headers-$(uname -r) -y
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl88*
sudo make dkms_install -y
lsusb
init 6 
