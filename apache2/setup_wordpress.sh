#!/bin/bash

#install
sudo apt-get install -y wordpress php libapache2-mod-php mysql-server php-mysql

CONFS="bestideas"
WPASS=$(cat ~/.secret_wordpressdbpass)

for CONF in $CONFS
do
	sudo cp conf/wordpress_${CONF}.conf /etc/apache2/sites-available/

	#disable test site
	sudo a2dissite ${CONF}

	#enable wordpress site
	sudo a2ensite wordpress_${CONF}
	sudo systemctl reload apache2
done

#mysql config
sudo mysql -u root -e "CREATE DATABASE wordpress;"
sudo mysql -u root -e "CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY \"${WPASS}\";"
sudo mysql -u root -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER ON wordpress.* TO 'wordpressuser'@'localhost';"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

#php config
sudo cp conf/config-localhost.php.sample /etc/wordpress/config-localhost.php

echo "\nINFO: Setup your Wordpress site from localhost/blog\n"

echo "\n\nNOTE: If your web server is located in cloud, you have to create /etc/wordpress/config-yourdomainname.php so you can manage your Wordpress site\n\n"
