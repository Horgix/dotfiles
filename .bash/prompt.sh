# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# prompt.sh for Bash
# Basic bash prompt with some colors

bold='\[\e[1m\]'    # Enables bold
nobold='\[\e[22m\]' # Disables bold

reset='\[\e[0m\]'   # Resets all styles

hc='\[\e[36m\]'     # Host color
sc='\[\e[33m\]'     # Separator color
wc='\[\e[34m\]'     # Working Directory color
gc='\[\e[32m\]'     # Global Informations color
pc='\[\e[34m\]'     # Prompt color

sysinfos="$bold$hc\u$sc@$hc\H"
timeinfos="$nobold$gc [\D{%H:%M}]"
wd="$bold$wc\w"
secondline="$pc> $reset"

export PS1="
$sysinfos\
$timeinfos\
$wd
$secondline"

# EOF
