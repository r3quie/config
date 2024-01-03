#!/usr/bin/env fish

function runbashs
    cp ~/scripts/.functions.sh ~/.local/cache/usercstm/
    chmod +x ~/.local/cache/usercstm/.functions.sh
    echo -e "\n$whichfnc" >> ~/.local/cache/usercstm/.functions.sh
    ~/.local/cache/usercstm/.functions.sh
    rm ~/.local/cache/usercstm/.functions.sh
end

function fncStartup
    set whichfnc fncStartup
    runbashs
end

function fncSetuplinks
    set whichfnc fncSetuplinks
    runbashs
end

function gitpushconfig
    set whichfnc gitpushconfig
    runbashs
end

function fncSetGITDIR
    set whichfnc fncSetGITDIR
    runbashs
end