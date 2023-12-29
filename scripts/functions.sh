#!/bin/bash

# setup systemd service for automatic git pulls
fncStartup () {
    cd ~/.config/systemd/user
    sudo ln -sf ~/gitrepos/config/scripts/services/startup.service

    cd /usr/bin
    sudo ln -sf /home/$USER/gitrepos/config/scripts/startup.sh

    sudo systemctl enable script.service
}

