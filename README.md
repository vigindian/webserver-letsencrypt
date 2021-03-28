# Apache Webserver with SSL Certs using letsencrypt

This solution has been tested in Ubuntu and should work in all Debian systems <br />

## Solution Details

My Site: https://bestideas.duckdns.org
<br />

Web Server: Apache<br />
DNS: Duck DNS (https://www.duckdns.org)<br />
OS: Ubuntu<br />
SSL Certs: Letsencrypt (https://letsencrypt.org/) <br />
Blog template (Optional): Wordpress<br />

## 1. DuckDNS
a. Create DNS record for your domain. I chose this as it is free for 5 domains<br />

## 2. Letsencrypt Automation
a. Prepare domains.txt, config and hook.sh specific to your domain<br />
b. Update duckdns token for the domain in ~/.secret_domainname<br />
c. Run letsencrypt/duckdns_letsencrypt.sh<br />

## 3. Apache Config
a. Install apache and enable required modules with apache2/setup_apache2.sh<br />
b. Prepare your domain specific config in apache2/conf/<br />
c. Enable your domain config with apache2/enable_domains.sh<br />

### 3.1. Wordpress (Optional)
a. Prepare wordpress config in apache2/conf/wordpress_yourdomain.conf<br />
b. Update wordpress-db password in ~/.secret_wordpressdbpass<br />
c. Setup wordpress in your server using apache2/setup_wordpress.sh<br />
d. Manage your Wordpress site from localhost/blog<br />
e. If your site is located in Cloud, setup /etc/wordpress/config-yourdomainname.php and access your site using public_ip or dns_name<br /><br />

## References:
https://www.splitbrain.org/blog/2017-08/10-homeassistant_duckdns_letsencrypt<br />
https://github.com/lukas2511/dehydrated.git<br />
