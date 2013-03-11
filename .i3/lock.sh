# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# mylock.sh for i3
# Lock the screen using a background depending on resolution

#! /bin/sh

function lock()
{
    # Lockscreens images path
    local lockscreen_path=~/.i3/lockScreens/
    # Lockscreens images base name
    local lockscreen_basename=apertureLockscreen-
    # Get the current screen resolution
    local resolution=`xrandr | awk '/[*]/{print $1}'`

    local lockscreen=${lockscreen_path}${lockscreen_basename}${resolution}.png

    echo $lockscreen
    # Lock the screen using the appropriate wallpaper
    i3lock -c 000000 -i $lockscreen
}

lock

# EOF
