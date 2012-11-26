# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# .zshrc for ZSH
# Loads every needed configuration file for Zsh

for file in ~/.shell-config/*; do
    source $file;
done

for file in ~/.zsh/*; do
    source $file;
done

if [ -d ~/.local.zsh/ ]; then
    for file in ~/.local.zsh/*; do
        source $file;
    done
fi

if [ -f ~/.extra-paths ]; then
    source ~/.extra-paths
fi

true

# EOF
