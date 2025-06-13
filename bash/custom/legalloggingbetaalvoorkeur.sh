legalloggingbetaalvoorkeur() {
    cat $1 | jq '.items' | jq '[.[] | select(.what.action == "Bewaar betaal voorkeur")]' | jq 'map({reference, action: .what.action, when: .when, insz: .who.subject.insz, voorkeur: .details|map(select(.type == "meta"))|(.[0].items)|map(.value)})' | jq 'map(.reference + "," + .action + "," + .when + "," + .insz + "," + (.voorkeur|join(",")))' | jq '.[]' | sed 's/"//g'
}
