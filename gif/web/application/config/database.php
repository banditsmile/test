<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:26
 */

return array (
	'servercluster' =>
		array (
			'hostname' => $db_local['host'],
			'username' => $db_local['user_name'],
			'password' => $db_local['password'],
			'database' => 'images',
			'dbdriver' => 'mysql',
			'dbprefix' => '',
			'pconnect' => false,
			'db_debug' => true,
			'cache_on' => false,
			'cachedir' => '',
			'char_set' => 'utf8',
			'dbcollat' => 'utf8_general_ci',
			'swap_pre' => '',
			'autoinit' => true,
			'stricton' => false,
			'port' => 3306,
		),
);