# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# aliases.sh for SHELLS
# Defines a lot of useful aliases

# Nocorrect
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"

# ls
alias l="ls -lah --color"
alias ls="ls -lh --color"
alias ll="ls -lh --color"

# grep
alias grep="grep --color"

# Development
alias mygcc='gcc -Wall -Wextra -std=c99 -pedantic'
alias py='python2'

# mount
alias mymount='sudo mount /dev/sdb1 /media'
alias myumount='sudo umount /media'

# Vim
alias v="vim"
alias e="vim"
alias vmi="vim"

# Xrandr
alias xrandrVGA169only='xrandr --output VGA1 --mode 1920x1080 --output LVDS1 --off'
alias xrandrVGA43only='xrandr --output VGA1 --mode 1280x1024 --output LVDS1 --off'
alias xrandrBoth169='xrandr --output VGA1 --mode 1920x1080 --left-of LVDS1 --output LVDS1 --mode 1024x600'
alias xrandrBoth43='xrandr --output VGA1 --mode 1280x1024 --left-of LVDS1 --output LVDS1 --mode 1024x600'
alias xrandrLVDSOnly='xrandr --output VGA1 --off --output LVDS1 --mode 1024x600'

# Network
alias pingtest='ping -c 3 www.google.com'
alias p='pingtest'

# Sound
alias mute='amixer sset Master 0 mute'

# Directories
alias hop='/home/horgix/work/ing1/projects/corewar'
alias hop2='hop ; cd ./check/check_42sh'
alias dh='dirs -v'
alias conf='cd ~/.hgxonf'

# Power state
alias z='sh ~/.i3/lock.sh'
alias veille='z; sudo pm-suspend'

# Keymap
alias fr='setxkbmap fr'
alias us='setxkbmap us'

# SSH
alias myssh='ssh horgix@horgix.fr'
alias myssh2='ssh horgix@epimeros.org'
alias rakka='ssh horgix@rakka.prologin.org'

# Fun
alias starwars='traceroute 216.81.59.173 -m 255'

# Tar gZip Dir (Z) / Tar bzip2 (J) Dir
#function tzd { tar czvf "$1.tar.gz" "$1"; }
#function tjd { tar cjvf "$1.tar.bz2" "$1"; }

# Clean *.pyc in a directory
#alias nopyc="find -name '*.pyc' -print -delete"

# If iproute2 is present, do not use ifconfig!
#if which ip &>/dev/null; then
#    function ifconfig { echo 'You should use iproute2!'; }
#fi
