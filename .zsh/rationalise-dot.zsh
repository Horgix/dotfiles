# rationalise-dot.zsh
# A ZLE plugin to transform ... -> ../.. when typing.

function rationalise-dot {
    if [[ $LBUFFER = *.. ]]; then
        LBUFFER+=/..
    else
        LBUFFER+=.
    fi
}

zle -N rationalise-dot
bindkey . rationalise-dot
