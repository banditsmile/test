<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/5/21
 * Time: 下午2:55
 */
$file_array = file('ip');
$ip_array =  array();
foreach($file_array as $ip_info){
	$ip_info = trim($ip_info);
}