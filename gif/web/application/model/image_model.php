<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:21
 */

class image_model extends model{
	var $database = 'images';
	var $table = 'gif_info';
	public function __construct(){
		parent::__construct();
		mysqli_select_db($this->connect,$this->database);
	}
	public function get_next($id){
		$sql = 'select * from '.$this->table.' where id>'.$id.' order by id asc limit 1';
		if($result = mysqli_query($this->connect,$sql)){

		}
	}
}