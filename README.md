# nextcloud-dev

This is the SUNET nextcloud-custom container, running locally on port 8000 using
mariadb and garage for s3 storage. Along with Nextcloud and Garage, there is also
a Global Site Selector (gss) and Keycloak set up, and for database needs there is
a mariadb container.

There is one admin user, 'admin' with the password 'admin' set up for nextcloud,
gss and keycloak.

Log in with the username `user@sunet.dev` and the password `user` with saml in
keycloak.

Accessable urls are:
    http://localhost:8000 (nextcloud)
    http://localhost:8001 (gss)
    http://localhost:8080 (keycloak)

This is NOT the way SUNET runs the container, but it is usefull for debugging
or for developing apps.

Make sure your user is in the docker group and has id 1000, then you should be
able to run:

    git clone https://github.com/SUNET/nextcloud-dev
    cd nextcloud-dev
    docker-compose up -d
    firefox http://localhost:8000

You can put your local apps in ./local_apps and they should show up in nextcloud.
A simple way to use this repo for development locally, is to use the fact that
github is svn compatible and export the repo, that way you won't have git repos
in a git repo when you develop:

    svn export https://github.com/sunet/nextcloud-dev/trunk/ nc-dev
    cd nc-dev/
    docker-compose up -d
    cd local_apps/
    git clone git@github.com/your_org/your_nc_app.git
