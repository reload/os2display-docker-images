#!/usr/bin/env bash
set -euo pipefail

/usr/sbin/php-fpm7.3 --nodaemonize --fpm-config /etc/php/7.3/fpm/php-fpm.conf 
