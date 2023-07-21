create database keycloak if not exists;
create user 'keycloak'@'%' identified by 'keycloak' if not exists;
grant all on keycloak.* to 'keycloak'@'%';
