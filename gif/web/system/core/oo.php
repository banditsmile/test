<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:31
 */

class oo {
	static $config=array();
	public function __construct(){
		oo::$config['database'] = include(APP_PATH . '/config/database.php');
		oo::$config['router'] = include(APP_PATH . '/config/router.php');
	}
	public static function config($key,$value=null){
		if(is_null($value)){
			if(isset(oo::$config[$key])){
				return oo::$config[$key];
			}else{
				return false;
			}
		}else{
			if(isset(oo::$config[$key])){
				return false;
			}
		}
	}
}