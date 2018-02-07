#
# Script for prepare booting from an external USB Storage
# Pi4IoT - 06/01/2018
#

yellow='\e[0;33m'
yellow_bold='\e[0;1;33m'
green='\e[0;32m'
red_bold='\e[0;31m'
normal='\e[0m'

printf "\n${yellow}Filesystem:${normal}\n"
df -h
printf "\n${yellow}Installing the Tools:${NC}\n"
opkg update
opkg upgrade
opkg install kmod-usb-storage-extras e2fsprogs kmod-fs-ext4

printf "\n${red_bold}Formatting the Device:${NC}\n"
umount /tmp/mounts/USB-A1/
mkfs.ext4 /dev/sda1

printf "\n${yellow}Mounting the External Storage Device:${NC}\n" 
mkdir /mnt/sda1
mount /dev/sda1 /mnt/sda1

printf "\n${yellow}Duplicating the /overlay Directory:${NC}\n"
tar -C /overlay -cf - . | tar -C /mnt/sda1 -xf -
umount /mnt/sda1/

printf "\n${yellow}Finishing up...${NC}\n"
opkg install block-mount
block detect > /etc/config/fstab
sed -i '/enabled/s/0/1/g' /etc/config/fstab
sed -i 's/mnt\/sda1/overlay/g' /etc/config/fstab
printf "\n${red_bold}REBOOT NOW!${NC}\n"
