FROM php:8.0-apache

# Install XDebug
RUN pecl install xdebug && docker-php-ext-enable xdebug

# Set working directory
WORKDIR /var/www/html

# Copy source files to working directory
COPY index.php .

COPY docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
