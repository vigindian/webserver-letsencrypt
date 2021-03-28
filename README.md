# Apache Webserver with SSL Certs using letsencrypt

This solution has been tested in Ubuntu and should work in all Debian systems <br />

## 1. Letsencrypt Automation
a. Prepare domains.txt, config and hook.sh specific to your domain<br />
b. Run letsencrypt/duckdns_letsencrypt.sh<br /><br />

## 2. Apache Config
a. Install apache and enable required modules with apache2/setup_apache2.sh<br />
b. Prepare your domain specific config in apache2/conf/<br />
c. Enable your domain config with apache2/enable_domains.sh<br /><br />

References:

https://www.splitbrain.org/blog/2017-08/10-homeassistant_duckdns_letsencrypt<br />
https://github.com/lukas2511/dehydrated.git<br />
