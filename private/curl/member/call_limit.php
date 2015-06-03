<?php
$data = array('touserid'=>1011453);
$data = array('touserid'=>1078046,'debug'=>1);
$header = array("X-API-USERID:1078489","X-API-TOKEN:33047d7cc80b9d1a803ee3cc9ba611f3");
do_curl($data,$header);
function do_curl($data,$header=array(),$url='http://member.ailiaoba.net/permission/call'){
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
