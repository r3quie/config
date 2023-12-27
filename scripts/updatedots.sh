#!/bin/bash

# colors
source ~/scripts/colors.sh

# check if dots up to date
cd ~/gitrepos/dots-hyprland
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo -e "${BPurple}Git dots are up to date${Color_Off}"
else
	echo -e "${BPurple}Git dots are not up to date${Color_Off}"
fi

# check if ags up to date
cd ~/gitrepos/ags
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo -e "${BPurple}Git AGS is up to date${Color_Off}"
else
	echo -e "${BPurple}Git AGS is not up to date${Color_Off}"
fi

# stop for userinput
echo "press enter to continue with updating illogical-impulse, ctrl(+shift)+c to stop"
read

# pull ags
echo "pulling ags"
cd ~/gitrepos/ags
git pull origin
# install
npm install && meson setup build --reconfigure
echo "do not forget to sudo"
meson install -C build

# pull dots
echo "pulling dots"
cd ../dots-hyprland
echo "git pull origin"
git pull origin

# copy dotfiles
rm .config/fish/config.fish
echo "cp -r .config  ~"
cp -r .config  ~
echo "cp -r .local ~"
cp -r .local ~

# amend alpha to colorgeneration on bg change
if cat ~/.config/ags/scripts/color_generation/applycolor.sh | grep -q "sed -i 's/alpha=1/alpha=0.5/' ~/.config/foot/foot.ini"
then
    :
else 
    echo "sed -i 's/alpha=1/alpha=0.5/' ~/.config/foot/foot.ini" >> ~/.config/ags/scripts/color_generation/applycolor.sh
    echo "amended applycolor.sh - footopa"
fi

# just in case, might delete
cd ~/.config/fish
rm config.fish
ln -sf ~/gitrepos/config/.config/fish/config.fish

cd ~
