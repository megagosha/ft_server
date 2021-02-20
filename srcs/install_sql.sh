#bin/bash
export DEBIAN_FRONTEND=noninteractive
sed -i '932i extension=mcrypt' /etc/php/7.3/cli/php.ini
service mysql start
mysql < /usr/share/phpmyadmin/sql/create_tables.sql
mysql -e "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'pma_secure_password'"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'edebi'@'localhost' IDENTIFIED BY 'edebi_secure_password' WITH GRANT OPTION"
cp srcs/config.inc.php /usr/share/phpmyadmin/config.inc.php
unlink /etc/nginx/sites-enabled/default
rm /var/www/html/index.nginx-debian.html
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz
mv wordpress /var/www/html/
rm latest.tar.gz
mv srcs/wp-config.php /var/www/html/wordpress
ln -s /usr/share/phpmyadmin /var/www/html/wordpress
if [ "$AUTOINDEX" = "on" ]
then
  sed -i.bak 's/\<autoindex off\>/autoindex on/g' /etc/nginx/sites-available/localhost
fi
mysql -e "CREATE DATABASE wordpress_db"
mysql -e "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'wordpress_secure_login'@'localhost' IDENTIFIED BY 'wordpress_secure_password'"
mysql -e "FLUSH PRIVILEGES"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'edebi'@'localhost' IDENTIFIED BY 'edebi_secure_password' WITH GRANT OPTION"
service php7.3-fpm start
service nginx start
