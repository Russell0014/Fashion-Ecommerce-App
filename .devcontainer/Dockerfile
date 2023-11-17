FROM php:7.4-apache

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    mariadb-client \
    libmariadb-dev \
    git

# install pdo_mysql
RUN docker-php-ext-install pdo_mysql

# Set up Apache
WORKDIR /var/www/html
RUN a2enmod rewrite

# Expose port
EXPOSE 80
