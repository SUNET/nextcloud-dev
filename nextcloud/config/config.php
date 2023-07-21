<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'memcache.distributed' => '\\OC\\Memcache\\Redis',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'memcache.locking' => '\\OC\\Memcache\\Redis',
  'redis' =>
    array (
      'host' => 'redis',
      'port' => 6379,
    ),
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => false,
    ),
    2 => 
    array (
      'path' => '/var/www/html/local_apps',
      'url' => '/local_apps',
      'writable' => true,
    ),
  ),
  'instanceid' => getenv('INSTANCEID'),
  'passwordsalt' => getenv('PASSWORDSALT'),
  'secret' => getenv('SECRET'), 
  'trusted_domains' => 
  array (
    0 => 'localhost:8000',
  ),
  'dbtype' => 'mysql',
  'dbhost' => 'mariadb',
  'dbname' => 'nextcloud',
  'dbpassword' => getenv('MYSQL_PASSWORD'),
  'dbport' => '3306',
  'dbtableprefix' => 'oc_',
  'dbuser' => 'nextcloud',
  'version' => '26.0.3.3',
  'overwrite.cli.url' => 'http://localhost:8000',
  'installed' => true,
  'theme' => '',
  'loglevel' => 2,
  'maintenance' => false,
  'objectstore' => 
  array (
    'class' => '\\OC\\Files\\ObjectStore\\S3',
    'arguments' => 
    array (
      'bucket' => 'nextcloud',
      'hostname' => 'garage',
      'key' => getenv('S3_KEY'),
      'secret' => getenv('S3_SECRET'),
      'port' => 3900,
      'region' => 'garage',
      'use_path_style' => true,
      'use_ssl' => false,
    ),
  ),
  'datadirectory' => '/var/www/html/data',
  'gs.enabled' => 'true',
  'gs.federation' => 'global',
  'gs.trustedHosts' => ['*'],
  'gss.jwt.key' => getenv('JWT_KEY'),
  'gss.master.admin' =>
   array (
    0 => 'admin',
  ),
  'gss.master.url' => 'http://localhost:8001',
  'gss.mode' => 'slave',
  'gss.username_format' => 'sanitize',
);
