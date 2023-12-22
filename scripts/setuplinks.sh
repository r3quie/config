#!/bin/bash

cd ~
rm .bashrc
ln -sf ~/gitrepos/config/.bashrc

ln -sf ~/gitrepos/config/scripts

cd ~/.config/fish
rm config.fish
ln -sf ~/gitrepos/config/.config/fish/config.fish

cd ~
