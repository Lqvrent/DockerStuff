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
    php8.3-pgsql \
    libapache2-mod-php8.3

# Download the Azuriom installer
RUN curl -L https://github.com/Azuriom/AzuriomInstaller/releases/latest/download/AzuriomInstaller.zip -o /tmp/AzuriomInstaller.zip

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

CMD ["apachectl", "-D", "FOREGROUND"]
