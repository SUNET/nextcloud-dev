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
  'gs.enabled' => 'true',
  'gs.federation' => 'global',
  'gs.trustedHosts' => ['*'],
  'gss.discovery.manual.mapping.file' => '/var/www/html/config/mappingfile.json',
  'gss.discovery.manual.mapping.parameter' => 'urn:oid:1.3.6.1.4.1.5923.1.1.1.6',
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
);
