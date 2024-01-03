#!/usr/bin/env fish

# setup systemd service for automatic git pulls

function runbashs
    cp ~/scripts/.functions.sh ~/.local/cache/usercstm/
    chmod +x ~/.local/cache/usercstm/.functions.sh
    echo -e "\n$whichfnc" >> ~/.local/cache/usercstm/.functions.sh
    exec ~/.local/cache/usercstm/.functions.sh && rm ~/.local/cache/usercstm/.functions.sh
end

function fncStartup
    set -l whichfnc fncStartup
    runbashs
end

function fncSetuplinks
    set -l whichfnc fncSetuplinks
    runbashs
end

function gitpushconfig
    set -l whichfnc gitpushconfig
    runbashs
end

function fncSetGITDIR
    set -l whichfnc fncSetGITDIR
    runbashs
end