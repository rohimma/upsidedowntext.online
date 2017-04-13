#FROM ubuntu:16.04
#
#CMD curl -sL https://deb.nodesource.com/setup_6.x | bash -
#
#RUN apt-get -y update && apt-get install -y \
#    git \
#    php7.0-curl \
#    php7.0-fpm \
#    php7.0-mysql \
#    php7.0-mcrypt \
#    php7.0-mbstring \
#    php7.0-gettext \
#    unzip \
#    zip \
#    apt-utils \
#    nodejs \
#    npm \
#    nginx \
#    nano \
#    w3m \
#    supervisor \
#    && rm -rf /var/lib/apt/lists/*
#
#RUN phpenmod mcrypt
#RUN phpenmod mbstring
##
##CMD systemctl enable php7.0-fpm.service &&\
##    service php7.0-fpm.service start
#
#RUN git config --global http.sslVerify false
#
## forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log \
# && ln -sf /dev/stderr /var/log/nginx/error.log
#
#CMD mkdir -p /var/www
#
#COPY . /tmp/www
#
#RUN rm -rf /var/www && mkdir /var/www &&\
#    mv /tmp/www /var &&\
#    find /var/www/ -type d -exec chmod 755 {} \; &&\
#    find /var/www/ -type f -exec chmod 644 {} \; &&\
#    chown -R www-data:www-data /var/www
#
#CMD rm -rf /etc/nginx/sites-available/default \
#    rm -rf /etc/nginx/sites-enabled/default
#
#COPY /docker/default /etc/nginx/sites-available/default
#
#CMD ln -fns /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
#
#CMD mkdir -p /var/run/php
#
#COPY docker/conf/nginx.conf /etc/nginx/
#COPY docker/conf/supervisord.conf /etc/supervisor/conf.d/
#
#CMD curl -sS http://getcomposer.org/installer | php && \
#    mv composer.phar /usr/local/bin/composer
#
#WORKDIR /var/www
#
#CMD cp .env.docker .env && \
#    composer install --no-plugins --no-scripts --dev && \
#    php artisan key:generate && \
#    php artisan config:cache && \
#    npm install && \
#    npm rebuild node-sass && \
#    npm install --global webpack cross-env && \
#    npm run dev


FROM php:7.0-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt

EXPOSE 9000

#CMD ["php", "-a"]