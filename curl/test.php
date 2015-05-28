<?php
$data = array('touserid'=>1011453);
if(count($argv)<=1){
    echo "使用方法 php -f test.php 资源类型(helper|driver|model) 资源名称 方法名 参数1 参数2 参数3...";
    echo PHP_EOL;
    exit();
}

$data = array('name'=>$argv[2],'method'=>$argv[3],'param'=>$argv[4]);
$header = array("X-API-USERID:1078046","X-API-TOKEN:e02616463440b459fb65eca79c4c3deb");
$url = 'http://test.ailiaoba.net/test/'.$argv[1];
do_curl($data,$header,$url);
function do_curl($data,$header=array(),$url='http://test.ailiaoba.net/test/model'){
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
