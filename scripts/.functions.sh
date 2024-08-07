#!/bin/bash

# setup systemd service for automatic git pulls
fncStartup () {
    if cd ~/.config/systemd/user; then
        :
    else
        echo "systemd does not have a user dir in .config"
        echo "creating..."
        cd ~/.config
        mkdir systemd && cd systemd
        mkdir user && cd user
    fi
    sudo ln -sf ~/"$GITDIR"/config/scripts/services/startup.service

    cd /usr/bin
    sudo ln -sf $HOME/"$GITDIR"/config/scripts/startup.sh

    systemctl --user enable startup.service
}

fncSetuplinks () {
    cd ~
    rm .bashrc
    ln -sf ~/"$GITDIR"/config/.bashrc
    ln -sf ~/"$GITDIR"/config/.bashrc_aliases
    ln -sf ~/"$GITDIR"/config/scripts
    cd ~/.config/fish
    rm config.fish
    ln -sf ~/"$GITDIR"/config/.config/fish/config.fish
    cd ~
}

gitpush () {
    git add .
    echo "Enter commit name "
    read nm
    git commit -m "$nm"
    git push origin
}

fncSetGITDIR () {
    echo "Enter name of directory with git repos. If empty=gitrepos"
    read gr

    if [ -z "${gr}" ]; then
        gr=gitrepos
    fi

    if cat /etc/environment | grep -q "GITDIR"; then
        sudo sed -i s/GITDIR=$GITDIR/GITDIR=$gr/ /etc/environment
    else
        cp /etc/environment ~/environment
        echo -e "\nGITDIR="$gr"" >> ~/environment
        sudo mv ~/environment /etc/environment
    fi
}
