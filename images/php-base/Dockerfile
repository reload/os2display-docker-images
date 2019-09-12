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

COPY --from=composer:1.9.0 /usr/bin/composer /usr/bin/composer
RUN composer global require hirak/prestissimo
RUN composer global require rubenrua/symfony-clean-tags-composer-plugin
