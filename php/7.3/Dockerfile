FROM php:7.3-fpm-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions calendar exif gd gettext intl \
                           mysqli pcntl pdo_mysql shmop \
                           sockets sysvmsg sysvsem sysvshm \
                           wddx xdebug xsl opcache zip

COPY php /usr/local/etc

RUN touch /var/log/xdebug.log
RUN chown 1000:1000 /var/log/xdebug.log
