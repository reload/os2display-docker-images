ARG os2display_image_repository=os2display

FROM ${os2display_image_repository}/os2display-docker-base

## Create a user for the web app.
RUN addgroup --gid 9999 app
RUN adduser --uid 9999 --gid 9999 --disabled-password --gecos "Application" app
RUN usermod -L app

RUN apt-get update
RUN apt-get install -y --no-install-recommends nodejs npm
RUN npm update npm -g
