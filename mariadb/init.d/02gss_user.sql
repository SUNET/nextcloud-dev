create database gss if not exists;
create user 'gss'@'%' identified by 'gss' if not exists;
grant all on gss.* to 'gss'@'%';
