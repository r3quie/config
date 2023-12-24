#!/bin/bash

###### READ COMMENTS BEFORE RUNNING ######
### script assumes logged in sudoer (not root!)
echo "if you wish to run setup, enter password, press control+c to stop setup"
read
# system update + pacman
sudo pacman -Suy
sudo pacman -S fish git foot starship
sudo pacman -S --needed base-devel

# yay setup
mkdir gitrepos && cd gitrepos
git clone https://aur.archlinux.org/yay.git
chown -R "$SUDO_USER":"$SUDO_USER" yay                 #idk if works
cd yay
sudo makepkg -si
yay --version
cd ~/gitrepos
git clone https://github.com/r3quie/config.git
cp config/.config/fish/config.fish ~/.config/fish/config.fish

yay pfetch
sleep 1

######################################################### DOTS

echo "if you wish to install hyprland + illogical-impulse, continue, press ctrl(+shift)+c and reboot"
read
cd ~/gitrepos/
git clone -b illogical-impulse https://github.com/end-4/dots-hyprland.git && cd dots-hyprland

rm .config/fish/config.fish
echo "cp -r .config  ~"
cp -r .config  ~
echo "cp -r .local ~"
cp -r .local ~

cd ~/gitrepos/
git clone --recursive https://github.com/Aylur/ags.git && cd ags
npm install && meson setup build
echo "do not forget to sudo"
meson install -C build

if cat ~/.config/ags/scripts/color_generation/applycolor.sh | grep -q "sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini"
then
    :
else 
    echo "sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini" >> ~/.config/ags/scripts/color_generation/applycolor.sh
    echo "amended applycolor.sh - footopa"
fi


sleep 1
exec ~/gitrepos/config/scripts/setuplinks.sh

# ADD GITPULL ON STARTUP PLS


echo "restart pls"
