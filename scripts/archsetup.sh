#!/bin/bash

###### READ COMMENTS BEFORE RUNNING ######
### script assumes logged in sudoer (not root!)

echo "if you wish to run setup, enter password, press control+c to stop setup"
read

cd ~
# system update + pacman
sudo pacman -Suy
sudo pacman -S fish git foot starship
sudo pacman -S --needed base-devel

# set global var GITDIR
echo "Enter name of directory with git repos. If empty=gitrepos"
read gr

if [ -z "${gr}" ]; then
    gr=gitrepos
fi

echo "GITDIR="$gr"" >> GITDIR.sh
cp /etc/environment ~
echo "GITDIR="$gr"" >> ~/environment
sudo mv ~/environment /etc/environment
sudo mv GITDIR.sh /etc/profile.d/GITDIR.sh

# yay setup
mkdir "$gr" && cd "$gr"
git clone https://aur.archlinux.org/yay.git
chown -R "$USER":"$USER" yay                 #idk if works
cd yay
sudo makepkg -si
yay --version
cd ~ "$gr"
git clone https://github.com/r3quie/config.git

if source config/scripts/functions.sh; then
    :
else
    echo "sourcing functions failed"
    echo "debug on your own hah"
    exit
fi

yay pfetch
sleep 1

# startup
fncStartup

#links
fncSetuplinks

echo "base config has been installed"
sleep 1

############################ DOTS ############################
# userinput
echo "if you wish to install hyprland + illogical-impulse, continue, otherwise press ctrl(+shift)+c and reboot"
read

#yay
yay -S brightnessctl coreutils curl fish foot fuzzel gjs gnome-bluetooth-3.0 gnome-control-center gnome-keyring gobject-introspection grim gtk3 gtk-layer-shell libdbusmenu-gtk3 meson networkmanager npm plasma-browser-integration playerctl polkit-gnome python-pywal ripgrep sassc slurp starship swayidle swaylock typescript upower xorg-xrandr webp-pixbuf-loader wget wireplumber wl-clipboard tesseract yad ydotool adw-gtk3-git cava gojq gradience-git gtklock gtklock-playerctl-module gtklock-powerbar-module gtklock-userinfo-module hyprland-git lexend-fonts-git python-material-color-utilities python-pywal python-poetry python-build python-pillow swww ttf-material-symbols-variable-git ttf-space-mono-nerd ttf-jetbrains-mono-nerd wayland-idle-inhibitor-git wlogout

#ags
cd ~ "$gr"/
git clone --recursive https://github.com/Aylur/ags.git && cd ags
npm install && meson setup build
echo "do not forget to sudo"
meson install -C build

#dots
cd ~ "$gr"/
git clone -b illogical-impulse https://github.com/end-4/dots-hyprland.git && cd dots-hyprland
rm .config/fish/config.fish
echo "cp -r .config  ~"
cp -r .config  ~
echo "cp -r .local ~"
cp -r .local ~

#amend footopa
if cat ~/.config/ags/scripts/color_generation/applycolor.sh | grep -q "sed -i 's/alpha=1/alpha=0.5/' ~/.config/foot/foot.ini"
then
    :
else 
    echo -e "\nsed -i 's/alpha=1/alpha=0.5/' ~/.config/foot/foot.ini" >> ~/.config/ags/scripts/color_generation/applycolor.sh
    echo "amended applycolor.sh - footopa"
fi

echo "restart pls"
