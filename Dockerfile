FROM debian:buster
ARG DEBIAN_FRONTEND="noninteractive"
ENV AUTOINDEX off
WORKDIR /src
COPY . .
COPY srcs/nginxconf.com /etc/nginx/sites-available/localhost
RUN apt-get update && apt-get install -y php nginx-full php-mbstring php-curl \
    php-fpm php-zip php-gd php-mysql wget php-cgi php-mysqli php-pear php-mbstring php-gettext lsb-release gnupg vim openssl debconf-utils \
    unzip php-dev libmcrypt-dev php-pear php-json libnss3-tools ;\
    echo "mysql-apt-config mysql-apt-config/tools-component string mysql-tools" |  debconf-set-selections;\
    echo "mysql-apt-config mysql-apt-config/repo-codename select buster" |  debconf-set-selections;\
    echo "mysql-apt-config mysql-apt-config/select-preview select Disabled"|  debconf-set-selections;\
    echo "mysql-apt-config mysql-apt-config/unsupported-platform select abort"|  debconf-set-selections;\
    echo "mysql-apt-config mysql-apt-config/select-tools select Enabled"|  debconf-set-selections;\
    echo "mysql-apt-config mysql-apt-config/select-product select Ok"|  debconf-set-selections;\
    echo "mysql-apt-config mysql-apt-config/preview-component string"|  debconf-set-selections;\
    echo "mysql-apt-config mysql-apt-config/repo-url string http://repo.mysql.com/apt"|  debconf-set-selections;\
    echo "mysql-apt-config mysql-apt-config/repo-distro select debian"|  debconf-set-selections;\
    echo 'mysql-apt-config mysql-apt-config/select-server select mysql-5.7'|  debconf-set-selections;\
    wget "https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb";\
    dpkg -i mysql-apt-config_0.8.16-1_all.deb;\
    apt-get update && apt-get install -y mysql-server;\
    ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/;\
    unlink /etc/nginx/sites-enabled/default;\
    wget "https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.zip";\
    unzip phpMyAdmin-5.0.4*;\
    rm *.deb *.zip;\
    mv phpMyAdmin-5.0.4-all-languages /usr/share/phpmyadmin;\
    mkdir -p /var/lib/phpmyadmin/tmp;\
    chown -R www-data:www-data /var/lib/phpmyadmin;\
    cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php;\
    pecl install mcrypt;\
    mkdir /run/php/;\
    cd ~/ && mkdir mkcert && cd mkcert;\
    wget "https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64";\
    mv mkcert-* mkcert && chmod +x mkcert && ./mkcert -install && ./mkcert localhost;\
    chmod +x /src/srcs/install_sql.sh;
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80 443
CMD sh /src/srcs/install_sql.sh
