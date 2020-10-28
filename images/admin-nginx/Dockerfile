# Handles all static requests to the admin-backend and forwards any dynamic
# requests to admin-php.
ARG os2display_image_repository=os2display

FROM ${os2display_image_repository}/os2display-nginx-base

WORKDIR /var/www/admin

COPY config/admin.conf /etc/nginx/conf.d/
