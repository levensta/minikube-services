<?php

$cfg['blowfish_secret'] = 'SERVICES_BYLEVENSTABORNTOCODE21'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

$i = 0;

$i++;
/* Authentication type */
$cfg['Servers'][$i]['auth_type'] = 'cookie';
/* Server parameters */
$cfg['Servers'][$i]['host'] = 'mysql-svc:3306';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['AllowNoPassword'] = true;

$cfg['TempDir'] = '/tmp';
/**
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

?>