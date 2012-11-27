# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# mylock.sh for i3
# Lock the screen using a background depending on resolution

#! /bin/sh

function lock()
{
    # Get the lockscreen path
    local lockscreen_path=~/.i3/lockScreens/
    local VGA1_connected=`xrandr | grep 'VGA1 connected' | wc -l`
    if [ $VGA1_connected -eq 1 ]; then
        lockscreen_path=${lockscreen_path}lockscreen-1920x1080.png
    else
        lockscreen_path=${lockscreen_path}lockscreen-1024x600.png
    fi

    # Lock the screen
    i3lock -c 000000 -i $lockscreen_path
}

lock

# EOF
