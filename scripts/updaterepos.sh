#!/bin/bash

# store pwd as a variable to return to

startingpwd=$(pwd)

# colors
source ~/scripts/.colors.sh

# check if dots up to date
cd ~/"$GITDIR"/config
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo -e "${BYellow}Git config is up to date${Color_Off}"
   cup=0
else
	echo -e "${BPurple}Git config is not up to date${Color_Off}"
   cup=1
fi

# check if ags up to date
cd ~/"$GITDIR"/django
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo -e "${BYellow}Git django is up to date${Color_Off}"
   dup=0
else
	echo -e "${BPurple}Git django is not up to date${Color_Off}"
   dup=1
fi

cd ~/"$GITDIR"/edhcarddealer
git remote update
if git status -uno | grep -q "Your branch is up to date"; then
	echo -e "${BYellow}Git edhcarddealer is up to date${Color_Off}"
   eup=0
else
	echo -e "${BPurple}Git edhcarddealer is not up to date${Color_Off}"
   eup=1
fi

# stop for userinput
echo -e "Let this script decide for you based on git status ${BGreen}(auto[M]atically)${Color_Off}"

read "last chance to ctrl-c"


#exit if both vars eq 0

if [ $((cup+dup+eup)) -eq 0 ]; then
   echo "script has found that no updates are needed"
   echo "exitting..."
   exit
fi

# pull config
if [ $cup -eq 1 ]; then
echo "pulling config"
cd ~/"$GITDIR"/config
git pull origin
echo "sourcing new .bashrc"
source ~/.bashrc
fi

if [ $dup -eq 1 ]; then
# pull dots
echo "pulling django"
cd ~/"$GITDIR"/django
echo "git pull origin"
git pull origin
fi

if [ $eup -eq 1 ]; then
# pull dots
echo "pulling edhcarddealer"
cd ~/"$GITDIR"/edhcarddealer
echo "git pull origin"
git pull origin
fi

cd $startingpwd