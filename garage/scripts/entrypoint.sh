#!/bin/bash

garage="/garage"

# Let's steal these from nextcloud example config
key='EJ39ITYZEUH5BGWDRUFY'
secret='M5MrXTRjkyMaxXPe2FRXMTfTfbKEnZCu+7uRTVSj'

id=$(docker exec garage /garage status | tail -1 |awk '{print $1}')
version=$(docker exec garage /garage layout show | grep "Current cluster layout version" | awk -F ':' '{print $2}' | sed 's/\s//')
${garage} layout assign "${id}" -z nextcloud -c 10 -t docker
${garage} layout apply --version $(( version + 1 ))
${garage} layout show
${garage} bucket create nextcloud
${garage} key import -n nextcloud-app-key "${key}" "${secret}"
${garage} bucket allow \
  --read \
  --write \
  --owner \
  nextcloud \
  --key nextcloud-app-key
