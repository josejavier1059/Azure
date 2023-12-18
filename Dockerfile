FROM drupal:latest
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y \
    unzip \
    && rm -rf /var/lib/apt/lists/*
RUN chown -R www-data:www-data /var/www/html
RUN a2enmod rewrite
RUN a2ensite 000-default && service apache2 restart
EXPOSE 80
CMD ["apache2-foreground"]

