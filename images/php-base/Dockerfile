ARG os2display_image_repository=os2display

FROM ${os2display_image_repository}/os2display-docker-base

RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      php7.3-cli \
      php7.3-xdebug \
      php7.3-mysql \
      php7.3-curl \
      php7.3-mbstring \
      php7.3-gd \
      php7.3-xml \
      php7.3-zip \
      imagemagick \
      git \
      patch \
    && \
    # No plans on adding any other repos.
    apt-get autoremove --purge -y software-properties-common && \
    apt-get clean && \
    rm -rf \
      /var/lib/apt/lists/* \
      /tmp/* \
      /var/tmp/*

# Install composer 1.8.6 using the latest installer.
# We compare the downloaded installer with a hash from a second source to reduce
# the chanche we're downloading a compromised installer.
RUN curl -o /tmp/composer-installer https://getcomposer.org/installer && \
  curl -o /tmp/composer-installer.sig https://composer.github.io/installer.sig &&  \
  php -r "if (hash('SHA384', file_get_contents('/tmp/composer-installer')) !== trim(file_get_contents('/tmp/composer-installer.sig'))) { unlink('/tmp/composer-installer'); echo 'Invalid installer' . PHP_EOL; exit(1); }" && \
  php /tmp/composer-installer --version=1.8.6 --filename=composer --install-dir=/usr/local/bin && \
  php -r "unlink('/tmp/composer-installer');" && \
  php -r "unlink('/tmp/composer-installer.sig');"
RUN composer global require hirak/prestissimo
RUN composer global require rubenrua/symfony-clean-tags-composer-plugin
