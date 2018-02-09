If you haven't enough flash storage on your Omega2 then you need to booting from a USB drive or Micro-SD card! 
This two script help you to make your USB drive or Micro-SD card bootable. 
For Micro-SD card use the script sdCardBoot.sh and for the  USB Stick usbboot.sh.
By Step 3 us `usbboot.sh` or `sdCardBoot.sh` dependent what you use.

### Step 1
First, you need to install git in order to download the script.
```sh
$ opkg update
$ opkg install git git-http ca-bundle
```
### Step 2
Clone the repository containing the script.
```sh
$ git clone https://github.com/pi4iot/Omega2_External_Storage.git
```
### Step 3
Make sure the Micro SD card is inserted, then make the script executable and run it. 
Warning: this will format the Micro SD card and erase all of its content.

For MicroSD Card:
```sh
$ cd Omega2_External_Storage/
$ chmod +x sdCardBoot.sh
$ ./sdCardBoot.sh
```
For USB Stick:
```sh
$ cd Omega2_External_Storage/
$ chmod +x usbboot.sh
$ ./usbboot.sh
```
### Step 4
Reboot the system and enjoy the expanded storage!
```sh
$ reboot 
```
now 
