#!/bin/bash

###### READ COMMENTS BEFORE RUNNING ######
### script assumes logged in sudoer (not root!)
echo "if you wish to run setup, enter password, press control+c to stop setup"

# system update + pacman
sudo pacman -Suy
sudo pacman -S fish git foot starship
sudo pacman -S --needed base-devel

# yay setup
git clone https://aur.archlinux.org/yay.git
chown -R "$SUDO_USER":"$SUDO_USER" yay                 #idk if works
cd yay
sudo makepkg -si
cd ..
yay --version
mkdir gitrepos
cd gitrepos
git clone https://github.com/r3quie/config.git
exec ~/gitrepos/config/scripts/setuplinks.sh

# MAKE EFFECTIVE PLS
exec ~/gitrepos/config/scripts/setuplinks.sh
yay pfetch
sleep 1
echo "if you wish to install hyprland + illogical-impulse, continue, press ctrl(+shift)+c and reboot"
read
cd ~/gitrepos/
git clone -b illogical-impulse https://github.com/end-4/dots-hyprland.git

exec ~/gitrepos/dots-hyprland/install.sh
sleep 1
exec ~/gitrepos/config/scripts/setuplinks.sh

echo "restart pls"
