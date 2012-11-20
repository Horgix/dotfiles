# rcon.zsh
# Commands to send rcon commands to a Q3 server

function rcon_to_port {
    case "$1" in
        q3)
            RCON_PORT=27961
            ;;
        urt)
            RCON_PORT=27960
            ;;
        *)
            RCON_PORT="$1"
    esac
    echo "$RCON_PORT"
}

# Configures the rcon access
function rconconfig {
    read RCON_HOST?'Host: ' && export RCON_HOST

    read RCON_PORT?'Port (or one of [q3, urt]): '
    export RCON_PORT=$(rcon_to_port "$RCON_PORT")

    read -s RCON_PASSWORD?'Password: ' && export RCON_PASSWORD
}

# Sends a rcon command. Requires netcat.
function rcon {
    if ! [ -x "$(which nc)" ]; then
        echo >&2 'error: netcat is required'
        return 1
    fi

    [ -z "$RCON_PASSWORD" ] && rconconfig

    cmd="$*"
    crafted="$(printf "\xff\xff\xff\xffrcon $RCON_PASSWORD $cmd\n")"

    echo "$crafted" \
        | nc -u -q 1 "$RCON_HOST" "$RCON_PORT" \
        | filter_rcon_result
}

# Filters the rcon result to remove print commands
function filter_rcon_result {
    perl -0777 -lpe 's/\xff\xff\xff\xffprint\n//g'
}
