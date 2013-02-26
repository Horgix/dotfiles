#! /bin/sh

i3status | while :
do
    read line

    host="$USER@$(hostname)"
    host="[{ \"full_text\": \"${host}\", \"color\":\"#`~/.i3/time-to-color.py`\" },"
    keymap=$(setxkbmap -query | grep 'layout' | awk -e '{ print $2 }' | tr\
            'a-z' 'A-Z')
    keymap="{ \"full_text\": \"${keymap}\" },"
    echo "${line/[/${host}${keymap}}" || exit 1
done
