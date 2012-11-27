# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# aliases.sh for SHELLS
# Defines a lot of useful aliases

alias cp="nocorrect cp"
alias e="vim"
alias grep="grep --color"
alias mkdir="nocorrect mkdir"
alias mv="nocorrect mv"
alias v="vim"
alias sn="byobu -AS"
alias s="byobu -Ax"

alias dc="cd" # too much errors

# ls: handle GNU ls and BSD ls
if ls --version &>/dev/null || gls --version &>/dev/null; then
    if ls --version &>/dev/null; then
        ls="ls"
    else
        ls="gls"
    fi
    alias ls="$ls -lah --color"
    alias lsp="ls --ignore=*.pyc"
    unset ls
else
    # Emulate above aliases for a BSD ls
    alias ls="ls -lah -G"

    # FIXME: Not bash compatible
    # function lsp { ls $* | grep -v '.pyc$'; return $pipestatus[1] }
fi

# rm: GNU/BSD too
if rm --version &>/dev/null || grm --version &>/dev/null; then
    if grm --version &>/dev/null; then
        rm="grm"
    else
        rm="rm"
    fi
    alias rm="$rm --one-file-system"
    unset rm
else
    # Not supported in BSD rm...
    true
fi

which rlwrap &>/dev/null && alias ocaml="rlwrap ocaml"

# Tar gZip Dir / Tar bzip2 (J) Dir
function tzd { tar czf "$1.tar.gz" "$1"; }
function tjd { tar cjf "$1.tar.bz2" "$1"; }

# Clean *.pyc in a directory
alias nopyc="find -name '*.pyc' -print -delete"

# If iproute2 is present, do not use ifconfig!
if which ip &>/dev/null; then
    function ifconfig { echo 'you should use iproute2!'; }
fi

# p1 -> ping -c 1, useful to see if the network is accessible
alias p1="ping -c 1 -W 2"





# Standard Aliases
alias l='ls'

# XRANDR aliases
alias xrandrVGA169only='xrandr --output VGA1 --mode 1920x1080 --output LVDS1 --off'
alias xrandrVGA43only='xrandr --output VGA1 --mode 1280x1024 --output LVDS1 --off'
alias xrandrBoth169='xrandr --output VGA1 --mode 1920x1080 --left-of LVDS1 --output LVDS1 --mode 1024x600'
alias xrandrBoth43='xrandr --output VGA1 --mode 1280x1024 --left-of LVDS1 --output LVDS1 --mode 1024x600'
alias xrandrLVDSOnly='xrandr --output VGA1 --off --output LVDS1 --mode 1024x600'

# Convenience aliases
alias pingtest='ping -c 3 www.google.com'
alias myssh='ssh horgix@horgix.fr'
alias myssh2='ssh horgix@epimeros.org'
alias z='sh ~/.i3/lock.sh'
alias hop='/home/horgix/work/42sh/42wish-bitbucket-git/'
alias hop2='hop ; cd ./check/check_42sh'
alias veille='z; sudo pm-suspend'
alias mygcc='gcc -Wall -Wextra -std=c99 -pedantic'
alias py='python2'
alias conf='cd ~/.hgxonf'
alias dh='dirs -v'

# EOF
