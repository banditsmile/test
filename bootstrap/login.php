<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/2
 * Time: 下午11:17
 */

/**
 * @param $key
 * @return string
 */
function get_post($key){
	$value =  isset($_POST[$key]) ? $_POST[$key] : (isset($_get[$key])?$_get[$key]:'');
	return trim($value);
}

/**
 * @param int $status
 * @param string $message
 * @param array $data
 */
function json_output($status=0,$message='',$data=array()){
	header('Content-type: application/json');
	exit(json_encode(array('errno'=>$status,'message'=>$message,'data'=>$data)));
}

$username = get_post('username');
$password = get_post('password');
$users = include './config/users.php';
if(empty($username)||empty($password) || !isset($users[$username]) ||$password!==$users[$username][1]){
	json_output(401,'验证失败');
}