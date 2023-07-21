# nextcloud-dev
This is the SUNET nextcloud-custom container, running locally on port 8000 using sqlite.

There is one user, 'admin' with the password 'admin'.

This is NOT the way SUNET runs the container, but it is usefull for debugging or for developing apps.

Make sure your user is in the docker group and has id 1000, then you should be able to run:

docker-compose up -d

You can put your local apps in ./local_apps and they should show up in nextcloud
