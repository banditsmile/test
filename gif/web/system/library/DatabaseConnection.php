<?php

/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/26
 * Time: 下午4:06
 */
class DatabaseConnection {
	private $_handle = null;

	private function __construct(){
		$this->init();
	}

	private function init(){
		if(is_null($this->_handle)){
			$connection = include APP_PATH.'/config/database.php';
			$this->_handle = mysqli_connect($connection['host'],
				$connection['username'],
				$connection['password'],
				$connection['database']);
			mysqli_set_charset($this->_handle,$connection['char_set']);
		}
	}

	public function handle(){
		return $this->_handle;
	}

	public static function get(){
		static $db = null;
		if ( $db == null )
			$db = new DatabaseConnection();
		return $db;
	}
}