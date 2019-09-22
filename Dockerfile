FROM php:7.3-apache

ENV APACHE_DOCUMENT_ROOT /var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

#Possible values for ext-name:
#bcmath bz2 calendar ctype curl dba dom enchant exif fileinfo filter ftp gd gettext gmp hash iconv imap interbase intl json ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite pgsql phar posix pspell readline recode reflection session shmop simplexml snmp soap sockets sodium spl standard sysvmsg sysvsem sysvshm tidy tokenizer wddx xml xmlreader xmlrpc xmlwriter xsl zend_test zip
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install exif
RUN docker-php-ext-install hash
RUN docker-php-ext-install json
RUN docker-php-ext-install mbstring
#RUN docker-php-ext-install intl
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install tokenizer
#RUN docker-php-ext-install xml
#RUN docker-php-ext-install zip
#RUN docker-php-ext-install gd
#RUN docker-php-ext-install curl



# Change UID
ARG UID
ENV UID ${UID:-1000}
ARG GID
ENV GID ${GID:-1000}
RUN usermod -u $UID www-data
RUN groupmod -g $GID www-data
RUN chmod +s /usr/sbin/apache2
USER www-data
CMD apachectl -D FOREGROUND
