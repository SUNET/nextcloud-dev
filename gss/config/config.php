<?php
$CONFIG = array (
  'instanceid' => 'ocv97i5mvjzf',
  'passwordsalt' => 'TxBvoYLatUxpP76k/eI3RIxmQqffUy',
  'secret' => 'NqYBemdyPKfmWRpBeH9jRsKNI3pGJpBc9SaJs8j1YvXycAJw',
  'trusted_domains' => 
  array (
    0 => 'localhost:8001',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '26.0.7.1',
  'overwrite.cli.url' => 'http://localhost:8001',
  'dbname' => 'gss',
  'dbhost' => 'mariadb',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'gss',
  'dbpassword' => getenv('MYSQL_PASSWORD'),
  'installed' => true,
  'gs.enabled' => 'true',
  'gs.federation' => 'global',
  'gs.trustedHosts' => 
  array (
    0 => '*',
  ),
  'gss.discovery.manual.mapping.file' => '/var/www/html/config/mappingfile.json',
  'gss.discovery.manual.mapping.parameter' => 'username',
  'gss.discovery.manual.mapping.regex' => true,
  'gss.jwt.key' => getenv('JWT_KEY'),
  'gss.master.admin' =>
   array (
    0 => 'admin',
  ),
  'gss.master.url' => 'http://localhost:8001',
  'gss.mode' => 'master',
  'gss.user.discovery.module' => '\\OCA\\GlobalSiteSelector\\UserDiscoveryModules\\ManualUserMapping',
  'gss.username_format' => 'sanitize',
  'theme' => '',
  'loglevel' => 0,
  'maintenance' => false,
);
