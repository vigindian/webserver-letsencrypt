#!/bin/bash

############
# FUNCTIONS
############
function usage(){
        echo -e "USAGE:\n$0 DOMAIN\nEg: $0 bestideas.duckdns.org\n"
        exit 1
}

function wpAccess(){
	currAccess=$(ls -l /etc/wordpress/htaccess|awk '{print $4}')
	if [ "$currAccess" != "www-data" ];then
		sudo chown -R root:www-data /etc/wordpress
		sudo chmod -R 775 /etc/wordpress

		sudo chown -R root:www-data /usr/share/wordpress/wp-content
		sudo chmod -R 775 /usr/share/wordpress/wp-content
	else
		echo "INFO: wordpress permissions already set"
	fi
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

#wordpress plugins to install - separate by whitespace
PLUGINS="protection-against-ddos disable-wp-rest-api disable-xml-rpc-pingback all-in-one-wp-migration google-site-kit newsletter"

#install wp cli
if [ ! -x ${WPBIN} ];then
  sudo curl -so ${WPBIN} https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  sudo chmod +x ${WPBIN}
fi

#prereq
wpAccess

#install plugins
for plugin in $PLUGINS
do
	sudo wp plugin install ${plugin} --activate --path=${WPHOME} --url=${DOMAIN} --allow-root
done
