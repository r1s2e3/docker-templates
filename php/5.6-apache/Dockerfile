FROM php:5.6-apache

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions bcmath bz2 calendar dba exif gd gettext intl \
                           mcrypt mysql mysqli pcntl pdo_mysql shmop soap \
                           sockets sysvmsg sysvsem sysvshm \
                           wddx xdebug opcache zip

COPY php /usr/local/etc

RUN useradd -u 1000 www

RUN touch /var/log/xdebug.log
RUN chown www:www /var/log/xdebug.log

RUN a2enmod rewrite
