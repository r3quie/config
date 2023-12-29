#!/usr/bin/env fish

# setup systemd service for automatic git pulls
function fncStartup
    if cd ~/.config/systemd/user; then
        :
    else
        echo "systemd does not have a user dir in .config"
        echo "creating..."
        cd ~/.config
        mkdir systemd && cd systemd
        mkdir user && cd user
    end
    sudo ln -sf ~/gitrepos/config/scripts/services/startup.service

    cd /usr/bin
    sudo ln -sf /home/$USER/gitrepos/config/scripts/startup.sh

    systemctl --user enable startup.service
end