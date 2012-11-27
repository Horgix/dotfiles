# HGXonf
# by Alexis 'Horgix' Chotard
# https://bitbucket.org/Horgix/

# prompt.zsh for ZSH
# Full zsh prompt configuration

# precmd : stuff that need to be refreshed before each prompt display
precmd ()
{
    # Refresh VCS infos (used for GIT in our case)
    vcs_info

    # Set TERMWIDTH as number of colums minus one.
    local TERMWIDTH
    (( TERMWIDTH = $COLUMNS - 1 ))

    # System infos : username@hostname:tty(SHLVL)
    SYSINFOS="%n@%M:%l(%L)"
    # FULL System informations with fancy stuff
    SYSINFOS_FULL=$PRE_SYSINFOS$SYSINFOS$POST_SYSINFOS

    # FULL Working directory with fancy stuff
    WD_FULL=$RET$PRE_WD$WD$POST_WD

    # GIT Infos : currently only the current branch name
    GIT_INFOS=${vcs_info_msg_0_}

    # ${[varname]:-[string]} returns the value of ${[varname]} normally,
    # but uses [string] instead if ${[varname]} doesn't exist.
    # ${:-[string]} is a quick way to do variable-related things to fixed strings.
    # ${([flags])[varname]} uses the flags to alter how the value of the
    # variable is handled. The percent sign causes prompt expansion to be done
    # on the variable.
    local SYSINFOS_len=${#${(%):-$SYSINFOS_FULL}}
    local WD_len=${#${(%):-$WD}}
    local WD_FULL_len=${#${(%):-$WD_FULL}}

    # Truncates the path if it's too long to hold on a single line

    WD_NEWLEN=0
    FILLBAR=""
    if [[ "$SYSINFOS_len + $WD_FULL_len" -gt $TERMWIDTH ]]; then
        ((WD_NEWLEN=$TERMWIDTH - $SYSINFOS_len - ($WD_FULL_len - $WD_len)))
    else
        FILLBAR="$SHIFT_IN\${(l.(($TERMWIDTH - ($SYSINFOS_len + $WD_FULL_len)))..${HBAR}.)}$SHIFT_OUT"
    fi
    # Truncates the working directory string
    WD_truncated="%$WD_NEWLEN<...<$WD%<<"

    SYSINFOS="%B$PR_CYAN%n%b$PR_YELLOW@%B$PR_CYAN%M%b$PR_YELLOW:%l(%L)"
    # Refresh the old values and apply the SHIFTs on fancy stuff around it
    WD_FULL=%b$PR_CYAN$SHIFT_IN$PRE_WD$SHIFT_OUT%B$PR_BLUE$WD_truncated%b$PR_CYAN$SHIFT_IN$POST_WD$SHIFT_OUT
    SYSINFOS_FULL=$SHIFT_IN$PRE_SYSINFOS$SHIFT_OUT$SYSINFOS%b$PR_CYAN$SHIFT_IN$POST_SYSINFOS$SHIFT_OUT

    # RINFOS ; Random informations displayed on the RPROMPT
    SECOND_LINE="$SHIFT_IN$LL_CORNER$SHIFT_OUT$GIT_INFOS%B$PR_BLUE> %b"
    RINFOS_FULL="%B%S$PR_RED$RET%s$PR_GREEN$TIME %b$PR_YELLOW$DATE%b$PR_CYAN$SHIFT_IN$LR_CORNER$SHIFT_OUT$PR_NO_COLOR"
}

# Stuff that only needs to be set once (when a new instance of zsh is ran)
setprompt ()
{
    setopt prompt_subst
    setopt extended_glob
    # VCS Support
    autoload -Uz vcs_info

    # Format the vcs infos to only get the git branch
    zstyle ':vcs_info:*' actionformats \
        '%F{13}%F{13}%b%F{11}|%F{9}%a%F{11}%f'
    zstyle ':vcs_info:*' formats \
        '%F{13}%F{5}#%b%F{14}%f'
    zstyle ':vcs_info:*' enable git hg

    typeset -A altchar
    set -A altchar ${(s..)terminfo[acsc]}
    SET_CHARSET="%{$terminfo[enacs]%}"
    SHIFT_IN="%{$terminfo[smacs]%}"
    SHIFT_OUT="%{$terminfo[rmacs]%}"
    HBAR=${altchar[q]:--}
    UL_CORNER=${altchar[l]:--}
    UR_CORNER=${altchar[k]:--}
    LL_CORNER=${altchar[m]:--}
    LR_CORNER=${altchar[j]:--}

    # See if we can use colors.

    autoload colors zsh/terminfo
    if [[ "$terminfo[colors]" -ge 8 ]]; then
        colors
    fi
    for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        #eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
        #eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
        eval PR_$color='%{$fg[${(L)color}]%}'
    done
    PR_NO_COLOR="%{$terminfo[sgr0]%}"

    # Working directory
    WD="%~"
    # Pre working directory : characters to display before wd
    PRE_WD="$UL_CORNER$HBAR("
    # Post working directory : characters to display after wd
    POST_WD=")$HBAR"

    # Pre system infos : characters to display before sysinfos
    PRE_SYSINFOS="$HBAR("
    # Post system infos : characters to display after sysinfos
    POST_SYSINFOS=")$HBAR$UR_CORNER"

    # RET : empty if return value is 0, value else
    RET="%(?..[%?]%s~)"

    # HOUR formated HOUR:MINUTES
    TIME="%D{%H:%M}"

    # DATE formated
    DATE="%D{%a,%b} %D{%d}"

    # (e) flag : cause a variable to undergo variable substitution
    export PROMPT='
$SET_CHARSER\
$WD_FULL\
${(e)FILLBAR}\
$SYSINFOS_FULL\

$SECOND_LINE\
'

    export RPROMPT='$RINFOS_FULL'
}

setprompt

# EOF
