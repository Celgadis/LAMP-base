ARG PHP_VERSION
FROM php:${PHP_VERSION}

# Instalar extensiones necesarias
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    libicu-dev \
    libonig-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    libxslt-dev \
    unzip \
    && docker-php-ext-install \
    ctype \
    curl \
    dom \
    gd \
    iconv \
    intl \
    json \
    mbstring \
    simplexml \
    spl \
    xml \
    zip \
    opcache \
    soap \
    tokenizer

# Copiar configuración personalizada de PHP
COPY ./config/php.ini /usr/local/etc/php/conf.d/custom.ini

# Copiar configuración personalizada de Apache
#COPY ./config/apache2.conf /etc/apache2/apache2.conf

# Habilitar módulos de Apache necesarios
RUN a2enmod rewrite
