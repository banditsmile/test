<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:37
 */

class router {
	public function __construct(){
		$this->init();
	}

	public function init(){
		include APP_PATH . '/config/router.php';
	}


}