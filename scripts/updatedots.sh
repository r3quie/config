#!/bin/bash

echo "press enter to continue with updating illogical-impulse, ctrl+c to stop"
read
echo "pulling dots"
cd ~/git\ repos/dots-hyprland

echo "git pull origin"
git pull origin

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

exec ~/copyall.sh
