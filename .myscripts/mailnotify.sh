#! /bin/bash

countall=$1
sendername=$2
subject=$3

/usr/bin/notify-send -t 3 "($countall) New mail from $sendername" "$subject"
/usr/bin/espeak -v mb/mb-en1 -s 110 -p 80 "You have a new email" --stdout | aplay
