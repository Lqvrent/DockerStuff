FROM ubuntu:20.04

# Add the PHP repository
RUN apt update -y
RUN apt install -y zip curl lsb-release apt-transport-https ca-certificates software-properties-common
RUN add-apt-repository -y ppa:ondrej/php

# Update repositories and install necessary packages
RUN apt-get update
RUN apt-get install -y \
    curl \
    unzip \
    nginx \
    openssl \
    supervisor \
    php8.3 \
    php8.3-bcmath \
    php8.3-ctype \
    php8.3-fpm \
    php8.3-mbstring \
    php8.3-pdo \
    php8.3-tokenizer \
    php8.3-xml \
    php8.3-xmlwriter \
    php8.3-curl \
    php8.3-zip \
    php8.3-sqlite3 \
    php8.3-mysql \
    php8.3-pgsql

# Download the Azuriom installer
RUN curl -L https://github.com/Azuriom/AzuriomInstaller/releases/latest/download/AzuriomInstaller.zip -o /tmp/AzuriomInstaller.zip

# Extract the archive to the web root
RUN unzip /tmp/AzuriomInstaller.zip -d /var/www/azuriom

# Configure Nginx to use Azuriom
COPY azuriom.conf /etc/nginx/sites-available/
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/azuriom.conf /etc/nginx/sites-enabled/azuriom.conf
RUN service nginx restart

# Enable PHP-FPM and Nginx
RUN mkdir -p /var/log/supervisor
RUN mkdir -p /run/php
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set permissions
RUN chmod -R 755 /var/www/azuriom
RUN chown -R www-data:www-data /var/www/azuriom

EXPOSE 80

CMD ["/usr/bin/supervisord", "-n"]
