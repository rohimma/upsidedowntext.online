FROM php:7.1-fpm
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
        && apt-get update && apt-get install -y \
        nodejs zip git \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv gd mcrypt mysqli mbstring \
    && rm -rf /var/lib/apt/lists/*

# install composer
RUN ["/bin/bash", "-c", "set -o pipefail && curl -O https://getcomposer.org/composer.phar && mv composer.phar composer && chmod +x composer && mv composer /usr/local/bin"]

## xdebug
#RUN echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.remote_port=9001" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

# php & xdebug port
EXPOSE 9000

WORKDIR /var/www/upsidedowntext.online

# composer install && npm install && npm run dev && chown www-data:www-data -R storage bootstrap/cache && cp .env.docker .env && php artisan key:generate && php artisan config:cache