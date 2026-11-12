#!/bin/bash

while read -r ip host rest; do
    if [ -z "$ip" ]; then
        continue
    fi

    if [[ "$ip" == "#" ]]; then
        continue
    fi

    dns=`nslookup "$host" | awk '/^Address: / { print $2 }' | head -n 1`

    echo "$ip"
    echo "$dns"
    if [[ "$ip" != "$dns" ]]; then
        echo "Bogus IP for $host in hosts!"
    fi
    echo "--------"


done < hosts