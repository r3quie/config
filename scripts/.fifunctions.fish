#!/usr/bin/env fish

# setup systemd service for automatic git pulls

function runbashs
    cp ~/scripts/.functions.sh ~/.local/cache/usercstm/
    xmod +x ~/.local/cache/usercstm/.functions.sh
    echo -e "\n$whichfnc" >> ~/.local/cache/usercstm/.functions.sh
    exec ~/.local/cache/usercstm/.functions.sh && rm ~/.local/cache/usercstm/.functions.sh
end

function fncStartup
    set -l whichfnc fncStartup
    runbash
end

function fncSetuplinks
    set -l whichfnc fncSetuplinks
    runbash
end

function gitpushconfig
    set -l whichfnc gitpushconfig
    runbash
end

function fncSetGITDIR
    set -l whichfnc fncSetGITDIR
    runbash
end