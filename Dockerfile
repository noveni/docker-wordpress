FROM wordpress:php7.1

RUN apt-get update && apt-get install -yqq git-all zlib1g-dev

COPY config/php.ini /usr/local/etc/php/

COPY config/server.crt /etc/apache2/ssl/server.crt
COPY config/server.key /etc/apache2/ssl/server.key
COPY config/default-ssl.conf /etc/apache2/sites-enabled/dev.conf

RUN docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN a2enmod rewrite
RUN a2enmod ssl
RUN service apache2 restart
