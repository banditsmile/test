<?php
$data = array(1,2,3,4);
foreach($data as $key => $value){
	if($key = 1){
		unset($data[$key]);
	}
	echo $value;
}
var_dump($data);
