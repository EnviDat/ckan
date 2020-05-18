#!/bin/sh
set -e

# URL for redis (required unless linked to a container called 'redis')
#: ${CKAN_REDIS_URL:=}


CONFIG="${CKAN_CONFIG}/development.ini"
CONFIG_TEMPLATE="${CKAN_CONFIG}/development.ini.new"

abort () {
  echo "$@" >&2
  exit 1
}

set_environment () {
#  export CKAN_SITE_ID=${CKAN_SITE_ID}
#  export CKAN_SITE_URL=${CKAN_SITE_URL}
#  export CKAN_REDIS_URL=${CKAN_REDIS_URL}
  export CKAN_STORAGE_PATH=/var/lib/ckan
#  export CKAN_SMTP_SERVER=${CKAN_SMTP_SERVER}
#  export CKAN_SMTP_STARTTLS=${CKAN_SMTP_STARTTLS}
#  export CKAN_SMTP_USER=${CKAN_SMTP_USER}
#  export CKAN_SMTP_PASSWORD=${CKAN_SMTP_PASSWORD}
#  export CKAN_SMTP_MAIL_FROM=${CKAN_SMTP_MAIL_FROM}
#  export CKAN_MAX_UPLOAD_SIZE_MB=${CKAN_MAX_UPLOAD_SIZE_MB}
}

write_config () {
  ckan-paster make-config --no-interactive ckan "$CONFIG_TEMPLATE"
}

# Create a config template for the uuid and the beaker secret
 if [ ! -e "$CONFIG_TEMPLATE" ]; then
  write_config
fi

#if [ -z "$CKAN_REDIS_URL" ]; then
#    abort "ERROR: no CKAN_REDIS_URL specified in docker-compose.yml"
#fi

# Check config
echo "\nCOPY this strings to your ini file the first time to replace default values and rebuild"
cat "$CONFIG_TEMPLATE" | grep beaker
cat "$CONFIG_TEMPLATE" | grep app_instance_uuid

echo "\nCHECK: These are the main parameters of your config file:"
cat "$CONFIG" | grep beaker
cat "$CONFIG" | grep app_instance_uuid
cat "$CONFIG" | grep solr
cat "$CONFIG" | grep sqlalchemy
cat "$CONFIG" | grep redis

set_environment
ckan-paster --plugin=ckan db init -c "$CONFIG"
exec "$@"
