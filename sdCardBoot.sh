#------------------------------------------------
# Script for prepare booting from an SD Card-----
# Pi4IoT - 06/01/2018----------------------------
#------------------------------------------------

yellow='\e[0;33m'
yellow_bold='\e[0;1;33m'
green='\e[0;32m'
red_bold='\e[0;31m'
normal='\e[0m'

printf "\n${yellow}Installing the Tools:${normal}\n"
opkg update
opkg upgrade
opkg install kmod-usb-storage-extras e2fsprogs kmod-fs-ext4

printf "\n${red_bold}Formatting the Device:${normal}\n"
umount /tmp/mounts/SD-P1/
mkfs.ext4 /dev/mmcblk0p1

printf "\n${yellow}Mounting the External Storage Device:${normal}\n"
mkdir /mnt/mmcblk0p1
mount /dev/mmcblk0p1 /mnt/mmcblk0p1

printf "\n${yellow}Duplicating the /overlay Directory:${normal}\n"
tar -C /overlay -cf - . | tar -C /mnt/mmcblk0p1 -xf -
umount /mnt/mmcblk0p1/

printf "\n${yellow}Finishing up...${normal}\n"
#opkg install block-mount
block detect > /etc/config/fstab
sed -i '/enabled/s/0/1/g' /etc/config/fstab
sed -i 's/mnt\/mmcblk0p1/overlay/g' /etc/config/fstab
printf "\n${RED}DONE! Now reboot the system!${normal}\n"
