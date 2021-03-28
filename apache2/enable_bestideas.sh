#!/bin/bash

CONFS="bestideas"

for CONF in $CONFS
do
	sudo cp conf/${CONF}.conf /etc/apache2/sites-available/
	sudo a2ensite ${CONF}
	sudo systemctl reload apache2
done
