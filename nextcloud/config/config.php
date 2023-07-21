<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'memcache.local' => '\\OC\\Memcache\\APCu',
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
  'instanceid' => 'octoue9ym05u',
  'passwordsalt' => 'hzmRixRvv/EfSSPNaW4rzJb3HuNqaW',
  'secret' => 'rvYyvVajC9W07ncVDwEWGYp/bLczQkMl/kmzLlrEl5d288sg',
  'trusted_domains' => 
  array (
    0 => 'localhost:8000',
  ),
  'dbtype' => 'mysql',
  'dbhost' => 'mariadb',
  'dbname' => 'nextcloud',
  'dbpassword' => 'nextcloud',
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
      'key' => 'EJ39ITYZEUH5BGWDRUFY',
      'secret' => 'M5MrXTRjkyMaxXPe2FRXMTfTfbKEnZCu+7uRTVSj',
      'port' => 3900,
      'region' => 'garage',
      'use_path_style' => true,
      'use_ssl' => false,
    ),
  ),
  'datadirectory' => '/var/www/html/data',
);
