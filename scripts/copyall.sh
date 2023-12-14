#!/bin/bash


#### Copy ####
cd ~/git\ repos/config/
cp -r scripts ~
cp .bashrc ~
cp .config/fish/config.fish ~/.config/fish/

#### Gnome to KDE ####

#### AGS ####
if cat ~/.config/ags/scripts/color_generation/applycolor.sh | grep -q "sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini"
then
    :
else 
    echo "sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini" >> ~/.config/ags/scripts/color_generation/applycolor.sh
    echo "amended applycolor.sh - footopa"
fi
