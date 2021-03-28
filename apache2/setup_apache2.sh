#!/bin/bash

#install apache
sudo apt-get install apache2 -y 

#disable default site on HTTP
a2dissite 000-default.conf

#enable ssl
sudo a2enmod ssl

#rewrite module
sudo a2enmod rewrite
