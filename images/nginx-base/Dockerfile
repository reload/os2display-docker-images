ARG os2display_image_repository=os2display

FROM ${os2display_image_repository}/os2display-docker-base

# Allow installations of prebuilt Ubuntu packages from official NGINX repository
RUN apt-get update
RUN apt-get install -y gnupg
RUN curl https://nginx.org/keys/nginx_signing.key -o nginx_signing.key
RUN apt-key add nginx_signing.key
RUN printf "deb https://nginx.org/packages/ubuntu/ bionic nginx\ndeb-src https://nginx.org/packages/ubuntu/ bionic nginx" > /etc/apt/sources.list
RUN apt-get update

# Now we can install NGINX
RUN apt-get install -y --no-install-recommends nginx

# Clean out temporary files, notices that you have to a squash to get any gains.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Disable the default site which will make our site the default.
RUN unlink /etc/nginx/conf.d/default.conf

# Following section is taken from the official nginx images

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
