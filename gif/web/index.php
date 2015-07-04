<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:13
 */
define('ENVIRONMENT', 'development');
define('APP_PATH',realpath(dirname(__FILE__)).'/application');
define('SYS_PATH',realpath(dirname(__FILE__).'/system'));
define('EXT','.php');
if (defined('ENVIRONMENT')) {
	switch (ENVIRONMENT){
		case 'development':
			error_reporting(E_ALL);
			break;
		case 'test':
		case 'production':
			error_reporting(0);
			break;
		default:
			exit('The application environment is not set correctly.');
	}
}

include APP_PATH.'/config/config.php';
include APP_PATH.'/config/constants.php';

include SYS_PATH.'/library/DatabaseConnection.php';

include SYS_PATH.'/helpers/common.php';


