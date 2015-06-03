<?php
$data = array('touserid'=>1011453);
$data = array('touserid'=>107848999999);
$header = array("X-API-USERID:1078046","X-API-TOKEN:e02616463440b459fb65eca79c4c3deb");
do_curl($data,$header);
function do_curl($data,$header=array(),$url='http://setting.ailiaoba.net/call.php'){
	$request = http_build_query($data);
	$ch = curl_init();
	curl_setopt($ch,CURLOPT_URL,$url);
	curl_setopt($ch,CURLOPT_POST,TRUE);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
	curl_setopt ($ch, CURLOPT_HTTPHEADER , $header );
	curl_setopt( $ch, CURLOPT_HEADER, 1);
	curl_setopt($ch,CURLOPT_POSTFIELDS,$request);
	echo __LINE__,'|',date('Y-m-d H:i:s'),PHP_EOL;
	$result = curl_exec($ch);
	echo __LINE__,'|',date('Y-m-d H:i:s'),PHP_EOL;
	print_r($result);
	echo PHP_EOL;
	curl_close($ch);
}
