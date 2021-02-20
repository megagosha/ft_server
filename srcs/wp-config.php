<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress_db' );

/** MySQL database username */
define( 'DB_USER', 'wordpress_secure_login' );

/** MySQL database password */
define( 'DB_PASSWORD', 'wordpress_secure_password' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         ';sD;/jYJGvL7<3asi%U~nWp#$lBB]h?TQG.9E{M{(6ZCLWAK>tn35LFdVLRS!ouS');
define('SECURE_AUTH_KEY',  'P(EEglmxv8C9w&9=-/Y5wyPsR_BBMS8{t$k5l&$uq2 lG-GC*%PaK-}+0-Ot6^$d');
define('LOGGED_IN_KEY',    '`G?S$|4_AL#KW(uKLO$0z;tgU#e8:t[d#Odsz+_lN<n+7%kcNb%1;RX,XpDB.QL%');
define('NONCE_KEY',        'bAZO6aQE0<taQN3F t85E]p=DV`mN2-5h9Oz7}AU_:(QX Hoe0Y-}IhA1f[tF(|f');
define('AUTH_SALT',        'e;[:{PCL9dvp9E`/H@9sae&%0G?y3aqF(MTKfZVZi,nVwJ+A#P:]?sQ)a--M,-7%');
define('SECURE_AUTH_SALT', '_E|sN7LzOv )?]fN~VSDYKoZ8@{AclXmQH|9.z;^>4+ifwvV PPR6k}Pwf<_O6.&');
define('LOGGED_IN_SALT',   'SP%%&4%T(q;D;gcr}MNBtN4C6t31SCfKQR cM2j%5Eyt!{5%s*,k}v&u5ZLM>&A_');
define('NONCE_SALT',       'dtRCF7^kzZ|5CY~T.iX7/L2s2Jm(^{#w[BxUTVPuT`Ar>C!@_~mUU- e|14k/?Cl');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';