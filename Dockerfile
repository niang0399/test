# Dockerfile
FROM serversideup/php:8.2-fpm-nginx
ENV PHP_OPCACHE_ENABLE=1
USER root
# Copy application files
COPY --chown=www-data:www-data . /var/www/html
# Install PHP dependencies
RUN composer install --ignore-platform-reqs
# Configure nginx
COPY nginx/nginx.prod.conf /etc/nginx/conf.d/default.conf
# Ensure proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html/public
# Clean up composer cache
RUN rm -rf /var/www/html/.composer/cache
# Switch to non-root user
USER www-data

Réagir

Répondre





