#!/bin/bash

id=$(docker exec garage /garage status | tail -1 |awk '{print $1}')
version=$(docker exec garage /garage layout show | grep "Current cluster layout version" | awk -F ':' '{print $2}' | sed 's/\s//')
docker exec garage /garage layout assign "${id}" -z nextcloud -c 10 -t docker
docker exec garage /garage layout apply --version $(( version + 1 ))
docker exec garage /garage layout show
