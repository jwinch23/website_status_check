#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Please provide a parameter"
    echo "Example: example or www.example.com"
    exit 1
fi

domain=$1
if [[ "$domain" != www.* && "$domain" != *.* ]]; then
    domain="www.$domain.com"
elif [[ "$domain" != www.* ]]; then
    domain="www.$domain"
fi

status_code=$(curl -s -o /dev/null -w "%{http_code}" $domain)

if [ $status_code -eq 200 ]; then
    echo "$(date) - Up - $status_code"
else
    echo "$(date) - Down - $status_code"
fi