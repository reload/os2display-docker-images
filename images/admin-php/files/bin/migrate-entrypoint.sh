#!/usr/bin/env bash
set -euo pipefail

if [[ -z "${SYMFONY_ENV:-}" ]] ; then
  if [[ $# -eq 0 ]] ; then
      echo "Syntax: $0 <environment>"
      exit 1
  else
    SYMFONY_ENV=$1
  fi
fi

cd /var/www/admin
echo "running migration in $SYMFONY_ENV"

SYMFONY_DEBUG=0

if [[ "${SYMFONY_ENV}" == "dev" ]] ; then
  SYMFONY_DEBUG=1
fi;

export SYMFONY_ENV=${SYMFONY_ENV}
export SYMFONY_DEBUG=${SYMFONY_DEBUG}

echo "Clearing cache"
gosu www-data bin/console cache:clear
echo "Running migrations"
gosu www-data bin/console doctrine:migrations:migrate --no-interaction
echo "Loading templates"
gosu www-data bin/console os2display:core:templates:load
