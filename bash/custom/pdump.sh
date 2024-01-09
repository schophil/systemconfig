pdump() {
    echo "Start listening on $1"
    socat TCP-LISTEN:$1,reuseaddr,fork STDIO
}

