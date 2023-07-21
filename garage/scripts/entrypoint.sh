#!/bin/sh

PATH=/bin
key=${S3_KEY}
secret=${S3_SECRET}
busybox --install -s /bin/
ln -s /garage /bin/garage

garage server &
server_pid=${!}
sleep  2s

if ! garage bucket list | grep nextcloud; then
  id=$(garage status | tail -1 | awk '{print $1}')
  version=$(garage layout show | grep "Current cluster layout version" | \
    awk -F ':' '{print $2}' | sed 's/\s//')
  garage layout assign "${id}" -z nextcloud -c 10 -t docker
  garage layout apply --version $(( version + 1 ))
  garage layout show
  garage bucket create nextcloud
  garage key import -n nextcloud-app-key "${key}" "${secret}"
  garage bucket allow \
    --read \
    --write \
    --owner \
    nextcloud \
    --key nextcloud-app-key
fi
kill ${server_pid}

garage server
