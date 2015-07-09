<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/7/6
 * Time: 上午11:13
 */

function json_output($data){
	is_string($data) or $data=json_encode($data);
	header("Content-type: application/json");
	echo $data;
	exit();
}