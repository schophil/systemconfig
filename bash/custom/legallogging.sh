legallogging() {
    cat $1 | jq '.items' | jq 'map_values(.reference + "," + .correlationId + "," + .when + "," + .who.subject.insz + "," + .what.source + "," + .what.action)' | jq '.[]' | sed 's/"//g'
}
