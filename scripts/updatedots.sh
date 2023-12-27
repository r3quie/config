#!/bin/bash

# colors
source ~/scripts/colors.sh

# check if dots up to date
cd ~/gitrepos/dots-hyprland
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo -e "${BPurple}Git dots are up to date${Color_Off}"
   dup=0
else
	echo -e "${BPurple}Git dots are not up to date${Color_Off}"
   dup=1
fi

# check if ags up to date
cd ~/gitrepos/ags
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo -e "${BPurple}Git AGS is up to date${Color_Off}"
   aup=0
else
	echo -e "${BPurple}Git AGS is not up to date${Color_Off}"
   aup=1
fi

# stop for userinput
echo -e "Do you want to update dots illogical-impulse and ags? ${BGreen}([d]ots/[a]gs/[b]oth/[n]one)${Color_Off}"
echo -e "Alternatively, let this script decide for you based on git status ${BGreen}(auto[M]atically)${Color_Off}"
while true; do

read -p "::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::" yn

case $yn in
        [dD] ) echo "updating dots only";
           dup=1;
           break;;
        [nN] ) echo not updating;
           echo exiting...;
           exit;;
        [aA] ) echo "updating ags only";
           aup=1;
           break;;
        [bB] ) echo "updating all";
           aup=1;
           dup=1;
           break;;
        [mM] ) echo "updating based on colored output";
           break;;
        * ) echo invalid response;;
esac

done

#exit if both vars eq 0

if [ $((aup+dup)) -eq 0 ]; then
   echo "script has found that no updates are needed"
   echo "exitting..."
   exit
fi

# pull ags
if [ $aup -eq 1 ]; then
echo "pulling ags"
cd ~/gitrepos/ags
git pull origin
# install
npm install && meson setup build --reconfigure
echo "do not forget to sudo"
meson install -C build
fi

if [ $dup -eq 1 ]; then
# pull dots
echo "pulling dots"
cd ~/gitrepos/dots-hyprland
echo "git pull origin"
git pull origin
fi

# copy dotfiles
cd ~/gitrepos/dots-hyprland
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
