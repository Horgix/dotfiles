# Script from Samuel "Staphylo" Angebault :
# https://bitbucket.org/Staphylo/
# Modified for personnal convenience by Alexis "Horgix" Chotard

#!/bin/bash

keymaps=('fr' 'us')

layout=$(setxkbmap -query | grep "layout" | grep -Eo "[^ ]*$")
variant=$(setxkbmap -query | grep "variant" | grep -Eo "[^ ]*$")
current=
next=0
loop=0
keynum=${#keymaps}

if [ -z $variant ]; then
    current="$layout"
else
    current="$layout $variant"
fi

#echo "${keymaps[@]}"

while [[ $loop < 2 ]]; do
    for map in "${keymaps[@]}"; do
        if [ $next == 1 ]; then
            setxkbmap $map
            notify-send -t 1 "Keymap Changed" "$map"
            exit 0
        fi
        if [[ "$map" = "$current" ]]; then
            next=1
        fi
    done
    loop=$(($loop + 1))
done
