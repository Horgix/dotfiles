# prompt.zsh for TSIALIE zsh configuration
# By Alexis 'Horgix' Chotard


# VCS Support
autoload -Uz vcs_info

zstyle ':vcs_info:*' actionformats \
    '%F{14}%F{11}%b%F{11}|%F{9}%a%F{11}%f'
zstyle ':vcs_info:*' formats \
    '%F{14}%F{11}%b%F{14}%f'
zstyle ':vcs_info:*' enable git hg

# precmd : stuff that need to be refreshed before each prompt display
precmd ()
{
    # Refresh VCS infos (used for GIT in our case)
    vcs_info

    # Set TERMWIDTH as number of colums minus one.
    local TERMWIDTH
    (( TERMWIDTH = $COLUMNS - 1 ))

    # FULL System informations with fancy stuff
    SYSINFOS_FULL=$PRE_SYSINFOS$SYSINFOS$POST_SYSINFOS

    # FULL Working directory with fancy stuff
    WD_FULL=$PRE_WD$WD$POST_WD

    # RET : empty if return value is 0, value else
    RET="%(?..%?)"

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

    # Truncate the path if it's too long to hold on a single line

    WD_NEWLEN=0
    FILLBAR=""
    if [[ "$SYSINFOS_len + $WD_FULL_len" -gt $TERMWIDTH ]]; then
        ((WD_NEWLEN=$TERMWIDTH - $SYSINFOS_len - ($WD_FULL_len - $WD_len)))
    else
        FILLBAR="$SHIFT_IN\${(l.(($TERMWIDTH - ($SYSINFOS_len + $WD_FULL_len)))..${HBAR}.)}$SHIFT_OUT"
    fi
    # Truncates the working directory string
    WD_truncated="%$WD_NEWLEN<...<$WD%<<"

    # Refresh the old values and apply the SHIFTs on fancy stuff around it
    WD_FULL=$SHIFT_IN$PRE_WD$SHIFT_OUT$WD_truncated$SHIFT_IN$POST_WD$SHIFT_OUT
    SYSINFOS_FULL=$SHIFT_IN$PRE_SYSINFOS$SHIFT_OUT$SYSINFOS$SHIFT_IN$POST_SYSINFOS$SHIFT_OUT

    # RINFOS ; Random informations displayed on the RPROMPT
    RINFOS_FULL="$RET$TIME $DATE$SHIFT_IN$LR_CORNER$SHIFT_OUT"
    SECOND_LINE="$SHIFT_IN$LL_CORNER$SHIFT_OUT$GIT_INFOS> "
}

# Stuff that only needs to be set once (when a new instance of zsh is ran)
setprompt ()
{
    setopt prompt_subst
    setopt extended_glob

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

    # Working directory
    WD="%~"
    # Pre working directory : characters to display before wd
    PRE_WD="$UL_CORNER$HBAR("
    # Post working directory : characters to display after wd
    POST_WD=")$HBAR"

    # System infos : username@hostname:tty(SHLVL)
    SYSINFOS="%n@%M:%l(%L)"
    # Pre system infos : characters to display before sysinfos
    PRE_SYSINFOS="$HBAR("
    # Post system infos : characters to display after sysinfos
    POST_SYSINFOS=")$HBAR$UR_CORNER"

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

# Enables/disables bold
bold=$'%{\e[1m%}'
nobold=$'%{\e[22m%}'

# Resets all styles
reset=$'%{\e[0m%}'
# hc = Host color
# sc = Separator color
# dc = Dir color
# pc = Prompt color
hc=$'%{\e[31m%}'
sc=$'%{\e[32m%}'
dc=$'%{\e[33m%}'
pc=$'%{\e[34m%}'

l2="$pc> $reset"
l1_end="$pc%D %*$hc%(?.. [$pc%?$hc])$n$%$WD_truncated"

setprompt
