<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/26
 * Time: 下午5:06
 */

function log_message($file_name,$msg){
	$file = LOG_DIR.$file_name.'.php';
	is_string($msg) or ($msg = json_encode($msg));
	$msg = date('Ymd His').'-->'.$msg;
	return file_put_contents($file,$msg.PHP_EOL);
}