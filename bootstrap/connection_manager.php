<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/29
 * Time: 下午6:04
 */


class connection_manager{
	public function __construct(){

	}

	public function debug($file_name,$message){
		$file_name =LOG_PATH.'/'.$file_name.'.php';
		is_string($message) or ($message=json_encode($message));
		$message = date('Ymd H:i:s').'-->'.$message;
		return file_put_contents($file_name,$message,FILE_APPEND);
	}
}
class local_manager extends connection_manager{
	var $config = array();
	public function __construct($config){
		parent::__construct();
		include_once '/var/www/test/config.php';
		$this->config = $config;
		$this->base_path = $this->config['base_path'];
	}

	public function connect(){

	}

	public function get_list($dir_name){
		$dir_path = rtrim($this->base_path,'/').'/'.ltrim($dir_name,'/');
		$dir_info = scandir($dir_path);
		$result = array();
		foreach($dir_info as $file){
			$file=='.'  and $result[]=$file;
		}
		return $result;
	}
}

class ftp_manager extends connection_manager{
	var $config ;
	var $session ;
	public function __construct($config){
		parent::__construct();
		include_once '/var/www/test/config.php';
		$this->config = $config;
	}

	public function connect(){
		if(!($this->session = ftp_connect($this->config['host'],$this->config['port']))){
			$this->debug('remote','remote connect failed');
			$this->debug('remote',error_get_last());
		}
		if(!ftp_logiin($this->session,$this->config['username'],$this->config['password'])){
			$this->debug('remote','remote auth failed');
			$this->debug('remote',error_get_last());
		}
	}

	public function check_connect(){
		if(!is_resource($this->session)){
			$this->connect();
		}
	}

	public function get_list($dir_name){
		$this->check_connect();
		$list = ftp_nlist($this->session,$dir_name);
		return $list;
	}
}

class ssh2_manager extends connection_manager{
	var $config = array();
	var $session = '';
	public function __construct($config){
		parent::__construct();
		$this->config = $config;
	}

	public function connect(){
		if(!($this->session = ssh2_connect($this->config['host'],$this->config['port']))){
			$this->debug('remote','remote connect failed');
			$this->debug('remote',error_get_last());
		}
		if(!ssh2_auth_password($this->session,$this->config['username'],$this->config['password'])){
			$this->debug('remote','remote auth failed');
			$this->debug('remote',error_get_last());
		}

	}

	public function get_list($dir_name){

	}
}

class conn_factory{
	public static $instance = array();
	public function __construct(){
	}

	public static function get_instance($config,$config_name='default'){
		if(!isset(self::$instance[$config_name])){
			$class_name = $config['protocol'].'_manager';
			self::$instance[$config_name] =new $class_name($config);
		}
		return self::$instance[$config_name];
	}
}