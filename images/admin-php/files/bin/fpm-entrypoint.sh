#!/usr/bin/env bash
set -euo pipefail

/usr/sbin/php-fpm7.2 --nodaemonize --fpm-config /etc/php/7.2/fpm/php-fpm.conf | tail -f $LOG_STREAM
