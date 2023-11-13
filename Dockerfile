FROM php:7.4-apache

# Install necessary packages
RUN apt-get update && \
    apt-get install -y \
    mariadb-client \
    libmariadbclient-dev \
    php-mysql \
    git

# Set up Apache
WORKDIR /var/www/html
COPY . .

# Set up PHP extensions and configurations as needed

# Expose port
EXPOSE 80

CMD ["apache2-foreground"]