#!bin/bash

cd ~
rm .bashrc
ln -sf ~/git\ repos/config/.bashrc

ln -sf ~/git\ repos/config/scripts

cd ~/.config/fish
rm config.fish
ln -sf ~/git\ repos/config/.config/fish/config.fish

cd ~
