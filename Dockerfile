FROM php:8.2-apache

RUN apt-get update && apt-get install -y unzip zip git libzip-dev \
    && docker-php-ext-install zip

RUN a2enmod rewrite

ENV APACHE_DOCUMENT_ROOT /var/www/html/testephp/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html
