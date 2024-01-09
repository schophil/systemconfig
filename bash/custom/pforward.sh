pforward() {
    socat TCP-LISTEN:$2,reuseaddr,fork TCP:$1
}
