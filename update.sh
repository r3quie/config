#!/bin/bash
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@";
while true; do

read -p "Do you want to run pacman and yay -Syu? (sudo needed) ([p]pacman/[y]ay/[b]oth/[n]one) " yn

case $yn in
        [yY] ) echo running only yay -Suy;
           echo running...;
           sudo -u "$SUDO_USER" yay -Suy;
           break;;
        [nN] ) echo not updating;
           echo exiting...;
           exit;;
        [pP] ) running only pacman -Suy;
           echo running...;
           pacman -Suy;
           break;;
        [bB] ) echo running full sys update;
           echo running...;
           pacman -Suy;
           sudo -u "$SUDO_USER" yay -Suy;
           break;;
        * ) echo invalid response;;
esac

done

sudo -u "$SUDO_USER" neofetch
echo "updated;)"
sleep 2
echo if something updated, restart recommended
