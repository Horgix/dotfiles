# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# aliases.sh for SHELLS
# Defines a lot of useful aliases

# Just some nocorrect aliases
alias cp="nocorrect cp"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"

# Vim aliases
alias v="vim"
alias e="vim"
alias vmi="vim"

# ls aliases
alias l="ls -lah --color"
alias ls="ls -lh --color"
alias ll="ls -lh --color"
alias la="ls -lah --color"

# XRANDR aliases
alias xrandrVGA169only='xrandr --output VGA1 --mode 1920x1080 --output LVDS1 --off'
alias xrandrVGA43only='xrandr --output VGA1 --mode 1280x1024 --output LVDS1 --off'
alias xrandrBoth169='xrandr --output VGA1 --mode 1920x1080 --left-of LVDS1 --output LVDS1 --mode 1024x600'
alias xrandrBoth43='xrandr --output VGA1 --mode 1280x1024 --left-of LVDS1 --output LVDS1 --mode 1024x600'
alias xrandrLVDSOnly='xrandr --output VGA1 --off --output LVDS1 --mode 1024x600'

# Convenience aliases
alias pingtest='ping -c 3 www.google.com'
alias z='sh ~/.i3/lock.sh'
alias hop='/home/horgix/work/ing1/projects/corewar'
alias hop2='hop ; cd ./check/check_42sh'
alias p='pingtest'
alias z='sh ~/.i3/lock.sh'
alias veille='z; sudo pm-suspend'
alias mygcc='gcc -Wall -Wextra -std=c99 -pedantic'
alias py='python2'
alias conf='cd ~/.hgxonf'
alias dh='dirs -v'
alias mute='amixer sset Master 0 mute'
alias hop='/home/horgix/work/ing1/projects/corewar/mcc-git'
alias hop2='/home/horgix/work/ing1/projects/TC/cake-git'

# Keymap Aliases
alias fr='setxkbmap fr'
alias us='setxkbmap us'

# My ssh aliases
alias myssh='ssh horgix@horgix.fr'
alias myssh2='ssh horgix@epimeros.org'
alias rakka='ssh horgix@rakka.prologin.org'

# Easy mount aliases
alias mymount='sudo mount /dev/sdb1 /media'
alias myumount='sudo umount /media'

# Fun aliases
alias starwars='traceroute 216.81.59.173 -m 255'

# Tar gZip Dir (Z) / Tar bzip2 (J) Dir
function tzd { tar czvf "$1.tar.gz" "$1"; }
function tjd { tar cjvf "$1.tar.bz2" "$1"; }

# Set color on standard commands
alias grep="grep --color"

# Clean *.pyc in a directory
alias nopyc="find -name '*.pyc' -print -delete"

# If iproute2 is present, do not use ifconfig!
if which ip &>/dev/null; then
    function ifconfig { echo 'You should use iproute2!'; }
fi
