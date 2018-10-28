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
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         's` (^vi=+K ~$mk;yu{=KkR0svED6mQFLR^P [fjr[LxHZ*$sqN85(Lt~t2 K~Tp');
define('SECURE_AUTH_KEY',  '8${[qhNN<|z^*=]ek7h)K>u8(0zw_wt{1XstW=q1[nbm){5uk!z|_0n}vwNUVv0a');
define('LOGGED_IN_KEY',    '&$ ?p#`J{D}D0[U;C! GM!rd](,!8Gd,(|o^b;JB`@crQ3*}y5@@(THKID+h]gpy');
define('NONCE_KEY',        '*(mZU@wXq4?7*uyTAKdEI@dKGmJv{aS8_APh;{}a3hVZ$[2XY$rsxl@Z5/dBW#WB');
define('AUTH_SALT',        'G.~;Ov7tf0:DVKwE+}gw^>5BP(t)H`PWMX;yNEM?$63^|OlB;  ESPYs1g=;CFfc');
define('SECURE_AUTH_SALT', 'teR,mk4V/AI3oz<%tz`ii1?)O&b1FW]z+W(svH>p/Slqhqg h!(n>HIvW=(hr:=a');
define('LOGGED_IN_SALT',   '&0>D2MR*[qz]7k4^L3_uqSVm7GKz]dG;bI{kXv E5mX@6A(fu%wbX%nzbp6j0r%^');
define('NONCE_SALT',       'SjpHn`Rm3r5c.CQ92`t3Ku=:7!bH8DEPx:PKsQ[NxHhVF/}Ul)ULeH+gWdkCoj]H');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
