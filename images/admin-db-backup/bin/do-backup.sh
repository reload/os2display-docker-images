#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

function check_empty {
    if [[ -z "${2}" ]]; then
        echo "Missing variable ${1}"
        exit 1
    fi
}
check_empty "MYSQL_HOST" "${MYSQL_HOST:-}"
check_empty "MYSQL_USER" "${MYSQL_USER:-}"
check_empty "MYSQL_PASSWORD" "${MYSQL_PASSWORD:-}"
check_empty "MYSQL_DATABASE" "${MYSQL_DATABASE:-}"
check_empty "GS_URL" "${GS_URL:-}"
check_empty "AUTH_JSON" "${AUTH_JSON:-}"

gcloud auth activate-service-account --key-file "${AUTH_JSON}"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
DESTINATION="${DUMP_PREFIX:-backup}-${TIMESTAMP}.sql.gz"
time mysqldump -u${MYSQL_USER} -p${MYSQL_PASSWORD} -h${MYSQL_HOST} ${MYSQL_DATABASE}| gzip > "${DESTINATION}"
gsutil cp "${DESTINATION}" "${GS_URL}"
