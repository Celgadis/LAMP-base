ARG PHP_VERSION
FROM php:${PHP_VERSION}

# Copiar configuración personalizada de PHP
COPY ./config/php.ini /usr/local/etc/php/conf.d/custom.ini

# Copiar configuración personalizada de Apache
#COPY ./config/apache2.conf /etc/apache2/apache2.conf

# Habilitar módulos de Apache necesarios
RUN a2enmod rewrite
