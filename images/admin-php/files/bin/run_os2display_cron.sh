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
echo "running in $SYMFONY_ENV"

SYMFONY_DEBUG=0

if [[ "${SYMFONY_ENV}" == "dev" ]] ; then
  SYMFONY_DEBUG=1
fi;

# The location of console changes between admin-releases - support both.
if [[ -x app/console ]]; then
  CONSOLE="app/console"
elif [[ -x bin/console ]]; then
  CONSOLE="bin/console"
else
  echo "Could not find console"
  exit 1
fi

# We pipe stderr to stdout as jobber won't log stderr.
SYMFONY_ENV=${SYMFONY_ENV} SYMFONY_DEBUG=${SYMFONY_DEBUG} gosu www-data $CONSOLE os2display:core:cron 2>&1
