create database if not exists gss;
create user if not exists 'gss'@'%' identified by 'gss';
grant all on gss.* to 'gss'@'%';
