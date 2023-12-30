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
    sudo ln -sf ~/"$GITDIR"/config/scripts/services/startup.service

    cd /usr/bin
    sudo ln -sf /home/$USER/"$GITDIR"/config/scripts/startup.sh

    systemctl --user enable startup.service
end

function fncSetuplinks
    cd ~
    rm .bashrc
    ln -sf ~/"$GITDIR"/config/.bashrc
    ln -sf ~/"$GITDIR"/config/scripts
    cd ~/.config/fish
    rm config.fish
    ln -sf ~/"$GITDIR"/config/.config/fish/config.fish
    cd ~
end

function gitpushconfig
    cd ~/"$GITDIR"/config
    git add .
    echo "Enter commit name "
    read nm
    git commit -m "$nm"
    git push origin main
end

function fncSetGITDIR
    echo "Enter name of directory with git repos. If empty=gitrepos"
    read gr

    if [ -z "$gr" ]; then 
        set gr gitrepos
    end
    echo "GITDIR="$gr"" >> GITDIR.sh
    sudo mv GITDIR.sh /etc/profile.d/GITDIR.sh
end