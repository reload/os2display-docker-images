#!/usr/bin/env bash
set -exuo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "${SCRIPT_DIR}"
source "../_variables.source"

set -x
docker push "${MAIN_IMAGE_REPOSITORY}/os2display-admin-nginx:${ADMIN_NGINX_BUILD_TAG}"
docker push "${MAIN_IMAGE_REPOSITORY}/os2display-admin-php:${ADMIN_PHP_BUILD_TAG}"
docker push "${MAIN_IMAGE_REPOSITORY}/os2display-elasticsearch:${ELASTICSEARCH_SOURCE_TAG}-${ELASTICSEARCH_BUILD_TAG}"
docker push "${MAIN_IMAGE_REPOSITORY}/os2display-redis:${REDIS_SOURCE_TAG}-${REDIS_BUILD_TAG}"
docker push "${MAIN_IMAGE_REPOSITORY}/os2display-search:${SEARCH_SOURCE_TAG}-${SEARCH_BUILD_TAG}"
docker push "${MAIN_IMAGE_REPOSITORY}/os2display-middleware:${MIDDLEWARE_SOURCE_TAG}-${MIDDLEWARE_BUILD_TAG}"
docker push "${MAIN_IMAGE_REPOSITORY}/os2display-screen:${SCREEN_SOURCE_TAG}-${SCREEN_BUILD_TAG}"
docker push "${MAIN_IMAGE_REPOSITORY}/os2display-admin-db-backup:${MARIADB_SOURCE_TAG}-${ADMIN_DB_BACKUP_BUILD_TAG}"

