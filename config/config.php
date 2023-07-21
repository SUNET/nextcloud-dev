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
  'passwordsalt' => 'MMxDEbVwf5ALYo+PkMMPwNeS6+TRZC',
  'secret' => 'FIJqZANy0PFNxZsskgnLTKvaEy4PkHEcNsSqyF6zePQ8ekgV',
  'trusted_domains' => 
  array (
    0 => 'localhost:8000',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'sqlite3',
  'version' => '26.0.3.3',
  'overwrite.cli.url' => 'http://localhost:8000',
  'installed' => true,
  'theme' => '',
  'loglevel' => 2,
  'maintenance' => false,
);
