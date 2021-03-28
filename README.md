# Apache Webserver with SSL Certs using letsencrypt

## 1. Letsencrypt Automation
a. Prepare domains.txt, config and hook.sh specific to your domain
b. Run letsencrypt/duckdns_letsencrypt.sh

## 2. Apache Config
a. Install apache and enable required modules with apache2/install_apache2.sh
b. Prepare your domain specific config in apache2/conf/
c. Enable your domain config with apache2/enable_yourdomain.sh

References:

https://www.splitbrain.org/blog/2017-08/10-homeassistant_duckdns_letsencrypt
https://github.com/lukas2511/dehydrated.git