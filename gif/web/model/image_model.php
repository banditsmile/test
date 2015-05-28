<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:21
 */

class image_model extends model{
	var $database = '';
	var $table = '';
	public function __construct(){
		parent::__construct($this->database,$this->table);
	}
	public function get_next($id){
		$sql = 'select * from '.$this->table.' where id>'.$id.' order by id asc limit 1';
		if($result = mysql_query($sql)){

		}
	}
}