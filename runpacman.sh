#!/bin/bash

while true; do

read -p "Do you want to run pacman -Syu? (sudo needed) (y/n) " yn

case $yn in
        [yY] ) echo sudo pls;
           [ "$UID" -eq 0 ] || exec sudo bash "$0" "$@";
           echo running...;
           pacman -Syu;
           break;;
        [nN] ) echo not updating;
           echo exiting...;
           exit;;
        * ) echo invalid response;;
esac

done

sudo -u "$SUDO_USER" neofetch
echo "updated;)"
