# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# .bashrc for bash
# Source every needed configuration file for bash

for f in ~/.shell-config/*; do
    source $f;
done

for f in ~/.bash/*; do
    source $f;
done

if [ -d ~/.local.bash/ ]; then
    for f in ~/.local.bash/*; do
        source $f;
    done
fi

if [ -f ~/.extra-paths ]; then
    source ~/.extra-paths
fi

true

# EOF
