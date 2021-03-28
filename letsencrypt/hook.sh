#!/usr/bin/env bash
set -e
set -u
set -o pipefail
 
domain="bestideas"
token=$(cat ~/.secret_${domain})
 
case "$1" in
    "deploy_challenge")
        curl "https://www.duckdns.org/update?domains=$domain&token=$token&txt=$4"
        echo
        ;;
    "clean_challenge")
        curl "https://www.duckdns.org/update?domains=$domain&token=$token&txt=removed&clear=true"
        echo
        ;;
    "deploy_cert")
        sudo systemctl restart apache2
        ;;
    "unchanged_cert")
        ;;
    "startup_hook")
        ;;
    "exit_hook")
        ;;
    *)
        echo Unknown hook "${1}"
        exit 0
        ;;
esac
