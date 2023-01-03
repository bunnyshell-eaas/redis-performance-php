FROM php:8.0-apache

# Install XDebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Set working directory
WORKDIR /var/www/html

# Copy source files to working directory
COPY index.php .

COPY docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN sed -i 's|Listen 80|Listen 8080|' /etc/apache2/ports.conf && sed -i 's|Listen 443|Listen 8443|' /etc/apache2/ports.conf && sed -i 's|80|8080| /etc/apache2/sites-enabled/000-default.conf'

#USER www-data
