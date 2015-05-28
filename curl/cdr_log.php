<?php
$data = array('userid'=>123,'switch'=>array('msg_accept','msg_voice' ,'msg_vibrated'));
$a_data = file('test.log');
$a_data = array('2014-09-30 15:52:48 #18288 Debug: file:diallog.php?{"callid":"Qk5cllP.7969uSWj","from_uri":"sip:1078489@121.199.1.132","to_uri":"sip:1078046@218.244.149.140:14066","from_mobile":"\"008613580892388\"","to_mobile":"","invite_times":"1412062320","ring_times":"1412062320","timestart":"1412062324","duration":"1244","timesclose":"1412063568","close_reason":"BYE","rtpproxy_sock":"121.40.159.40:8899","from_user_agent":"SuperPhone-iOS\/3.6.2\/\u611f\u89c9","to_user_agent":"","from_nets":"2","to_nets":"2","reply_code":"200","reply_reason":"OK"}');
foreach($a_data as $k=>&$data){
	echo substr($data,0,strpos($data,'{')),PHP_EOL;
	$data = substr($data,strpos($data,'{'));
	$data = json_decode($data,true);
	do_curl(array());
	exit();
}
function do_curl($data){
	$request = http_build_query($data);
	$ch = curl_init();
	curl_setopt($ch,CURLOPT_URL,'http://im_api.ailiaoba.net/cdr_log.php');
	curl_setopt($ch,CURLOPT_POST,TRUE);
	curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
	curl_setopt($ch,CURLOPT_POSTFIELDS,$request);
	echo __LINE__,'|',date('Y-m-d H:i:s'),PHP_EOL;
	$result = curl_exec($ch);
	echo __LINE__,'|',date('Y-m-d H:i:s'),PHP_EOL;
	print_r($result);
	echo PHP_EOL;
	curl_close($ch);
}
