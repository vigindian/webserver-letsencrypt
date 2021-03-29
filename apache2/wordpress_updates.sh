#!/bin/bash

############
# FUNCTIONS
############
function usage(){
        echo -e "USAGE:\n$0 DOMAIN\nEg: $0 bestideas.duckdns.org\n"
        exit 1
}

############
# MAIN
############
if [ "$#" -ne 1 ] ;then
        usage
fi

DOMAIN=$1
WPHOME="/usr/share/wordpress/"

WPBIN="/usr/local/bin/wp"

#install wp cli
if [ ! -x ${WPBIN} ];then
  sudo curl -so ${WPBIN} https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  sudo chmod +x ${WPBIN}
fi

#core update
sudo ${WPBIN} core update --path=${WPHOME} --url=${DOMAIN} --allow-root

#plugins update
sudo ${WPBIN} plugin --all update --path=${WPHOME} --url=${DOMAIN} --allow-root

#theme update
sudo ${WPBIN} theme update --all --path=${WPHOME} --url=${DOMAIN} --allow-root

#translations update
sudo ${WPBIN} core language update --path=${WPHOME} --url=${DOMAIN} --allow-root
