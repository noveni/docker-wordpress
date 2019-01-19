FROM wordpress:php7.1

RUN apt-get update && apt-get install -yqq git-all zlib1g-dev
RUN docker-php-ext-install zip

COPY config/php.ini /usr/local/etc/php/

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar | chmod +x wp-cli.phar | mv wp-cli.phar /usr/local/bin/wp
