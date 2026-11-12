#!/bin/bash

site=$1
ip=$2
dns=$3
real_ip=$(nslookup $site $dns | awk '/^Address: / { print $2 }')
buf=$(echo "$real_ip" | grep -i "$ip")
if  [[ "$buf" != "" ]]; then
    echo "Checks out!";
    exit 0;
else
    echo "Bad IP!";
    exit 1;
fi