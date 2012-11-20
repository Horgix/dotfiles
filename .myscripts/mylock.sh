#! /bin/sh

get_lock_path()
{
    lockscreen_path=/home/horgix/randomStuff/lockScreens/
    VGA1_connected=`xrandr | grep 'VGA1 connected' | wc -l`
    if [ $VGA1_connected -eq 1 ]; then
        lockscreen_path=$lockscreen_path"lockscreen-1920x1080.png"
    else
        lockscreen_path=$lockscreen_path"lockscreen-1024x600.png"
    fi
}

get_lock_path
i3lock -c 000000 -i $lockscreen_path

# EOF
