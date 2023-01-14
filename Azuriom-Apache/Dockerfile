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
    apache2 \
    openssl \
    php8.0 \
    php8.0-bcmath \
    php8.0-ctype \
    php8.0-fpm \
    php8.0-mbstring \
    php8.0-pdo \
    php8.0-tokenizer \
    php8.0-xml \
    php8.0-xmlwriter \
    php8.0-curl \
    php8.0-zip \
    libapache2-mod-php8.0

# Download the specified Azuriom tag
ARG AZURIOM_TAG=v1.1.0
RUN curl -L https://github.com/Azuriom/AzuriomInstaller/releases/download/${AZURIOM_TAG}/AzuriomInstaller.zip -o /tmp/AzuriomInstaller.zip

# Extract the archive to the web root
RUN unzip /tmp/AzuriomInstaller.zip -d /var/www/azuriom

# Configure Apache to use Azuriom
COPY azuriom.conf /etc/apache2/sites-available/
RUN a2dissite 000-default.conf
RUN a2ensite azuriom.conf
RUN a2enmod rewrite

# Set permissions
RUN chmod -R 755 /var/www/azuriom
RUN chown -R www-data:www-data /var/www/azuriom

EXPOSE 80

CMD apachectl -D FOREGROUND
