<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:14
 */
function get_post($key){
	var_dump($_GET);
	if(isset($_GET[$key])){
		var_dump($_GET);
		return $_GET[$key];
	}elseif(isset($_POST[$key])){
		return $_POST[$key];
	}else{
		return false;
	}
}

function show_error($message){
	return var_dump($message,true);
}