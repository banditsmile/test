<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:21
 */

class model {
	var $database='';
	var $tables = '';
	var $connect = null;
	public function __construct(){
		if(is_null($this->db_connection)){

			$this->connect = DatabaseConnection::get()->handle();
		}
	}
}