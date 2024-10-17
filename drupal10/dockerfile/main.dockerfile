FROM drupal:10

# Install dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd

# Set the working directory
WORKDIR /var/www/html

# Copy application source code
COPY . .

# Ensure correct permissions
RUN chown -R www-data:www-data /var/www/html

# Expose the HTTP port
EXPOSE 80
