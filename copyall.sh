#!/bin/bash


#### Copy ####
cd ~/git\ repos/config/
cp archsetup.sh ~
cp runpacman.sh ~
cp update.sh ~
cp .bashrc ~
cp .config/fish/config.fish ~/.config/fish/
cp gitpushconfig.sh ~
cp copyall.sh ~

#### Gnome to KDE ####

#### AGS ####
if cat ~/.config/ags/scripts/color_generation/applycolor.sh | grep "sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini"
then
    :
else 
    echo "sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini" >> ~/.config/ags/scripts/color_generation/applycolor.sh
fi