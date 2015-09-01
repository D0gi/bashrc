#!/bin/bash
cd /etc/apache2/sites-available/

if [ "$3" == "" ]; then
  echo "1. param= subdomain"
  echo "2. param= domain.tld"
  echo "3. parameter= /root/path/ (e.g. /var/www/html/netzanw/ )"
  exit
else
site="$1"
domain="$2"
rootpath="$3"
conf="$site"".conf"
echo '<VirtualHost *:80>' > "$conf"
#echo "\n" >> "$conf"
echo "ServerName $site.$domain" >> "$conf"
#echo "\n" >> "$conf"
echo "DocumentRoot $rootpath" >> "$conf"
#echo "\n" >> "$conf"
echo "CustomLog /var/log/apache2/$site/access.log combined" >> "$conf"
#echo "\n" >> "$conf"
echo "ErrorLog /var/log/apache2/$site/error.log" >> "$conf"
#echo "\n" >> "$conf"
echo 'LogLevel warn' >> "$conf"
#echo "\n" >> "$conf"
echo 'ServerSignature Off' >> "$conf"
#echo "\n" >> "$conf"
echo '</VirtualHost>' >> "$conf"
mkdir "/var/log/apache2/""$site"
a2ensite $conf
service apache2 restart
fi
