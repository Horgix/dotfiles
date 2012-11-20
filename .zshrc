# .zshrc
# Source every configuration file in .zsh

for f in ~/.zsh/*; do source $f; done
for f in ~/.shell-config/*; do source $f; done
test -d ~/.local.zsh/ && for f in ~/.local.zsh/*; do source $f; done

test -f ~/.extra-paths && source ~/.extra-paths

true

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
alias z='sh /home/horgix/.myscripts/mylock.sh'
alias hop='/home/horgix/work/42sh/42wish-bitbucket-git/'
alias hop2='hop ; cd ./check/check_42sh'
alias veille='z; sudo pm-suspend'
alias mygcc='gcc -Wall -Wextra -std=c99 -pedantic'
alias py='python2'

# Environment variables setting

export LC_ALL=en_US.utf8
export LANG="$LC_ALL"
export TERMINAL=urxvt
