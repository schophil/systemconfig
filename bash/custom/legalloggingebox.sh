legalloggingebox() {
    cat $1 | jq '.items' | jq '[.[] | select(.what.source == "eBox")]' | jq 'map({reference, action: .what.action, when: .when, insz: .who.subject.insz, session: .details|map(select(.type == "ebox"))|(.[0].webSessionId), provider: .details|map(select(.type == "ebox"))|(.[0].documentProviderId), message: .details|map(select(.type == "ebox"))|.[0]|.messages|[.[]?]|map(.messageId)[]})' | jq 'map(.reference + "," + .action + "," + .when + "," + .insz + "," + .session + "," + .provider + "," + .message)' | jq '.[]' | sed 's/"//g'
}
