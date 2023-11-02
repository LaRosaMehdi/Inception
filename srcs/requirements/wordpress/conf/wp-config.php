<?php

define( 'DB_NAME', getenv( 'MDB_NAME' ) );
define( 'DB_USER', getenv( 'MDB_USER' ) );
define( 'DB_PASSWORD', getenv( 'MDB_USER_PWD' ) );
define( 'DB_HOST', getenv('WP_MDB_HOST') . ':' . getenv('MDB_PORT')); 
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', 'utf8_bin' );

define('WP_SITEURL', 'https://' . getenv('DOMAIN_NAME'));
define('WP_HOME', 'https://' . getenv('DOMAIN_NAME'));

define('AUTH_KEY',         '*94o+xof{_|-%uA=EBe+}JmxXt6XA/Ez/mZ(M+*&=ih}-Y}d$*r|1bzHBwYl&n=+');
define('SECURE_AUTH_KEY',  '&.a|[*du={vqyTjdk|~[rN!B!ltVcP[/cw22*2h.S{s=l2-B[]eV0CdL#rKv0o`h');
define('LOGGED_IN_KEY',    '.[5ltt<ti{AM]5P~!U:NU0P02u?#SVnlM*/qNOelBew2d@2x*o{]&SPUyfBeTXk]');
define('NONCE_KEY',        'D`m+cBw7(-KR+wSm-|I7&MRs]x;d?L.k5A:^|!=Q:-g8GU(Z+ m7%tKq{)I&AD;P');
define('AUTH_SALT',        'yH>7`YzIjp<&JFi+Nw7F={-ee%(|^zHg|77VeF*n}4ad~eo$ku[R_[2wbYfBS4xE');
define('SECURE_AUTH_SALT', '~6Evw7WP*6WXYbyjo&g^ ~)D_-PCqb8,2+ZwY{/Ve)@;@{uK}EE#;7,c.Rwkw!@H');
define('LOGGED_IN_SALT',   'iI^/<k!B#U*|2)j%.lL;+ ri)X3o|Rmlu; ,5K|1a:+J0f 8 7%aq+F+-?=Bfkj/');
define('NONCE_SALT',       '+ p%X[fUsqRJN#$Iln@FaL3`:<9/yo&4:r>rsjSly8sx@xD3#i|.XS=#w/^rwU.=');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';