#!/usr/bin/env fish

function runbashs
    cp ~/scripts/.functions.sh ~/.local/cache/usercstm/
    chmod +x ~/.local/cache/usercstm/.functions.sh
    echo -e "\n$whichfnc" >> ~/.local/cache/usercstm/.functions.sh
    ~/.local/cache/usercstm/.functions.sh
    rm ~/.local/cache/usercstm/.functions.sh
end

function fncStartup
    set -g whichfnc fncStartup
    runbashs
end

function fncSetuplinks
    set -g whichfnc fncSetuplinks
    runbashs
end

function gitpush
    set -g whichfnc gitpush
    runbashs
end

function fncSetGITDIR
    set -g whichfnc fncSetGITDIR
    runbashs
end
