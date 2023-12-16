#!/bin/bash

cd ~/git\ repos/dots-hyprland
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo "Git dots are up to date"
else
	echo "Git dots are not up to date"
fi

cd ~/git\ repos/ags
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo "Git AGS is up to date"
else
	echo "Git AGS is not up to date"
fi

echo "press enter to continue with updating illogical-impulse, ctrl(+shift)+c to stop"
read
echo "pulling dots"
cd ~/git\ repos/dots-hyprland

echo "git pull origin"
git pull origin
rm .config/fish/config.fish
echo "cp -r .config  ~"
cp -r .config  ~
echo "cp -r .local ~"
cp -r .local ~

echo "pulling ags"
cd ../ags
git pull origin
npm install && meson setup build --reconfigure
echo "do not forget to sudo"
meson install -C build

if cat ~/.config/ags/scripts/color_generation/applycolor.sh | grep -q "sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini"
then
    :
else 
    echo "sed -i 's/alpha=1/alpha=0.3/' ~/.config/foot/foot.ini" >> ~/.config/ags/scripts/color_generation/applycolor.sh
    echo "amended applycolor.sh - footopa"
fi

cd ~/.config/fish
rm config.fish
ln -sf ~/git\ repos/config/.config/fish/config.fish

cd ~
