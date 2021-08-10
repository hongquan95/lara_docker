FROM php:8.0.5-fpm-alpine


RUN docker-php-ext-install pdo pdo_mysql

RUN curl -sS https://getcomposer.org/installer​ | php -- --install-dir=/usr/local/bin --filename=composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /app
COPY . .
COPY .env.example .env
# RUN composer install && php artisan key:generate
RUN composer install
