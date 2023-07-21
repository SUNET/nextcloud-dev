<?php
$CONFIG = array (
  'instanceid' => getenv('INSTANCEID'),
  'passwordsalt' => getenv('PASSWORDSALT'),
  'secret' => getenv('SECRET'),
  'trusted_domains' => 
  array (
    0 => 'localhost:8001',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '26.0.3.3',
  'overwrite.cli.url' => 'http://localhost:8001',
  'dbname' => 'gss',
  'dbhost' => 'mariadb',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'gss',
  'dbpassword' => getenv('MYSQL_PASSWORD'),
  'installed' => true,
);
