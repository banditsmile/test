<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/7/6
 * Time: 上午11:13
 */


function get_post($key){
	return isset($_GET[$key])?$_GET[$key]:(isset($_POST[$key]) ?$_POST[$key]:'');
}

function json_output($status,$message='',$data=array()){
	header('Content-type: application/json');
	echo json_encode(array('errno'=>$status,'msg'=>$message,'data'=>$data));
	exit();
}

function human_filesize($bytes, $decimals = 2) {
	$sz = 'BKMGTP';
	$factor = floor((strlen($bytes) - 1) / 3);
	return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . @$sz[$factor];
}

if(!function_exists('array_column')){
	function array_column($array,$col_name){
		$result = array();
		if(empty($array)){return $result;}
		foreach($array as $item){
			$result = isset($item[$col_name]) ? $item[$col_name] :null;
		}
		return $result;
	}
}

function log_debug($message){
	is_string($message) or $message=json_encode($message);
	$message = date('H:i:s').' --> '.$message.PHP_EOL;
	$log_file = LOG_PATH.'/'.date('Ymd').'.php';
	return file_put_contents($log_file,$message,FILE_APPEND);
}