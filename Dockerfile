FROM php:7.2-apache

# Install dependencies
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libxml2-dev \
    zlib1g-dev \
    git \
    zip \
    unzip

# Configure the gd library
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

# Install required PHP extensions
RUN docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql intl xml zip

# Set working directory
WORKDIR /var/www/html

# Copy source files to working directory
COPY index.php .

