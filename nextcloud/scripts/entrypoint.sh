#!/bin/bash
apt update
apt install -y bindfs
mkdir -p /var/www/html/local_apps
bindfs -o nonempty --force-user=www-data --force-group=www-data --create-for-user=1000 \
  --create-for-group=1000 --chown-ignore --chgrp-ignore /config /var/www/html/config
bindfs -o nonempty --force-user=www-data --force-group=www-data --create-for-user=1000 \
  --create-for-group=1000 --chown-ignore --chgrp-ignore /local_apps /var/www/html/local_apps

docker-php-entrypoint "${@}"
