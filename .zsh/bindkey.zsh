# bindkey.zsh
# Sets the keyboard mode and binds other keys.

# Vi^WEmacs mode ftw.
bindkey -e

# ^P -> edit command line in $EDITOR
autoload edit-command-line
zle -N edit-command-line
bindkey '^P' edit-command-line
