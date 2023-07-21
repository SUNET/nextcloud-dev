#!/bin/ash

garage="/garage"

# Let's steal these from nextcloud example config
key='EJ39ITYZEUH5BGWDRUFY'
secret='M5MrXTRjkyMaxXPe2FRXMTfTfbKEnZCu+7uRTVSj'

id=$(${garage} /garage status | /bin/busybox tail -1 |/bin/busybox awk '{print $1}')
version=$(${garage} layout show | /bin/busybox grep "Current cluster layout version" | /bin/busybox awk -F ':' '{print $2}' | /bin/busybox sed 's/\s//')
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
