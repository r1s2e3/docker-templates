FROM registry.gitlab.atwinta.ru/templates/docker/images/php-nginx:7.4

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions xdebug pdo_pgsql

COPY php /usr/local/etc

RUN touch /var/log/xdebug.log
RUN chown 1000:1000 /var/log/xdebug.log
