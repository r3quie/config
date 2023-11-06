#!/bin/bash

while true; do

read -p "Do you want to run pacman and yay -Syu? (sudo needed) ([p]pacman/[y]ay/[b]oth/[n]one): " yn

case $yn in
        [yY] ) echo running only yay -Suy;
           echo running...;
           yay -Suy | if grep --color=always -e "^" -e "there is nothing to do"; then echo yay not updated; else echo yay updated something; fi; 
           break;;
        [nN] ) echo not updating;
           echo exiting...;
           exit;;
        [pP] ) running only pacman -Suy;
           echo running...;
           sudo pacman -Suy | if grep --color=always -e "^" -e "there is nothing to do"; then echo pacman not updated; else echo pacman updated something; fi; 
           break;;
        [bB] ) echo running full sys update;
           echo running...;
           sudo pacman -Suy | if grep --color=always -e "^" -e "there is nothing to do"; then echo pacman not updated; else echo pacman updated something; fi; 
           yay -Suy | if grep --color=always -e "^" -e "there is nothing to do"; then echo yay not updated; else echo yay updated something; fi; 
           break;;
        * ) echo invalid response;;
esac

done

sleep 1
echo if something updated, restart recommended
