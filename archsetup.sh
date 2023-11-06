#!/bin/bash

###### READ COMMENTS BEFORE RUNNING ######
### script assumes logged in sudoer (not root!)
echo "if you wish to run setup, enter password, press control+c to stop setup"
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@";

# system update + pacman
pacman -Suy
pacman -S fish git foot starship
pacman -S --needed base-devel

# yay setup
git clone https://aur.archlinux.org/yay.git
chown -R "$SUDO_USER":"$SUDO_USER" yay                 #idk if works
cd yay
sudo -u "$SUDO_USER" makepkg -si
cd ..
yay --version
mkdir r3quie
cd r3quie
git clone https://github.com/r3quie/config.git

# MAKE EFFECTIVE PLS
cd config
cp .bashrc ~
cp runpacman.sh ~
cp update.sh ~
cp .config/foot/config.foot ~/.config/foot/
sudo -u "$SUDO_USER" yay pfetch
sleep 1
echo restart pls
