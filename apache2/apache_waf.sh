#!/bin/bash

MODSECPATH="/etc/modsecurity"

sudo apt-get install libapache2-mod-security2 -y
sudo cp ${MODSECPATH}/modsecurity.conf-recommended  ${MODSECPATH}/modsecurity.conf

sudo systemctl reload apache2

CONFS="default_waf wordpress_bestideas_waf"

for CONF in $CONFS
do
	APACHECONF=$(echo $CONF | sed "s/_waf//g")
	sudo cp conf/${CONF}.conf /etc/apache2/sites-available/${APACHECONF}
	sudo a2ensite ${APACHECONF}
	sudo systemctl reload apache2
done
