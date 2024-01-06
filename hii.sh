#!/bin/bash
cd kali-wifi-driver-and-wifi-hacking/
tar -xjvf compat-wireless-2010-06-28.tar.bz2 
cd compat-wireless-2010-06-28/    
sudo make unload 
sudo make load 
sudo apt update -y 
cd /home/$USER/
sudo apt install dkms git
sudo apt install build-essential libelf-dev linux-headers-$(uname -r)
git clone https://github.com/aircrack-ng/rtl8812au.git
cd rtl88*
sudo make dkms_install
lsusb
init 6
