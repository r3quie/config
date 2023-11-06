#!/bin/bash

pup=2
yup=2

while true; do

read -p "Do you want to run pacman and yay -Syu? (sudo needed) ([p]pacman/[y]ay/[b]oth/[n]one): " yn

case $yn in
        [yY] ) echo running only yay -Suy;
           echo running...;
           if yay -Suy | grep --color=always -e "^" -e "there is nothing to do"; then yup=0; else yup=1; fi; 
           break;;
        [nN] ) echo not updating;
           echo exiting...;
           exit;;
        [pP] ) running only pacman -Suy;
           echo running...;
           if sudo pacman -Suy | grep --color=always -e "^" -e "there is nothing to do"; then pup=0; else pup=1; fi;
           break;;
        [bB] ) echo running full sys update;
           echo running...;
           if sudo pacman -Suy | grep --color=always -e "^" -e "there is nothing to do"; then pup=0; else pup=1; fi; 
           if yay -Suy | grep --color=always -e "^" -e "there is nothing to do"; then yup=0; else yup=1; fi;
           break;;
        * ) echo invalid response;;
esac

done

if [ "$pup" -eq 1 ]; then
   echo "Pacman has updated something."
elif [ "$pup" -eq 0 ]; then
   echo "Pacman has not updated anything."
else
   :
fi
if [ "$yup" -eq 1 ]; then
   echo "Yay has updated something."
elif [ "$yup" -eq 0 ]; then
   echo "Yay has not updated anything."
else
   :
fi

sleep 1
echo if something updated, restart recommended
