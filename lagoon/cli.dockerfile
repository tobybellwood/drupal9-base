FROM uselagoon/php-8.0-cli-drupal:latest

# All files that should be available for install need to be copied.
COPY composer.* /app/
COPY assets /app/assets
COPY patches /app/patches

RUN composer install --no-dev
COPY . /app
RUN mkdir -p -v -m775 /app/web/sites/default/files

# Define where the Drupal root is located.
ENV WEBROOT=web
