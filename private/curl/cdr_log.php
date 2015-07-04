<?php
$a_data = json_decode('{"callid":"aaDCdlCKkU3hzA.qwP","from_uri":"sip:12950001106725@121.40.174.193","to_uri":"sip:12950001114975@121.199.4.106:10666","from_mobile":"\"17722520709\"","to_mobile":"","invite_times":"1433245157","ring_times":"1433245157","timestart":"1433245160","duration":"180","timesclose":"1433245215","close_reason":"Downstream BYE","rtpproxy_sock":"121.40.174.21","from_user_agent":"mosheng.weiling-Android\/1.3.0\/vivo X3t","to_user_agent":"","from_nets":"1","to_nets":"1","reply_code":"200","reply_reason":"OK","call_type":"call","vos_ip":"","turn_vos_status":"","from_host":"119.123.112.16:47536","to_host":"119.123.112.16:33739","hangup":"caller","from_media_info":"ewoJIkpCVUZTdGF0IjoJewoJCSJhdmdfZGVsYXkiOgkxMDYsCgkJIm1pbl9kZWxheSI6CTgwLAoJCSJtYXhfZGVsYXkiOgkxMjAsCgkJImRldl9kZWxheSI6CTksCgkJImF2Z19idXJzdCI6CTEwNiwKCQkibG9zdCI6CTAsCgkJImRpc2NhcmQiOgkwLAoJCSJlbXB0eSI6CTYKCX0sCgkiRVJSU3RhdCI6CXsKCQkiZXJyIjoJMCwKCQkibGVuIjoJNDYxNzYwLAoJCSJzaWxlbmNlIjoJMAoJfSwKCSJydHBwU3RhdCI6CXsKCQkidGltZW91dCI6CTIwMDAsCgkJImJlc3RfY2hvaWNlIjoJIjAuMC4wLjAiCgl9Cn0=","to_media_info":"ewoJIkpCVUZTdGF0IjoJewoJCSJhdmdfZGVsYXkiOgkxMzksCgkJIm1pbl9kZWxheSI6CTEyMCwKCQkibWF4X2RlbGF5IjoJMTYwLAoJCSJkZXZfZGVsYXkiOgk0LAoJCSJhdmdfYnVyc3QiOgkxMzksCgkJImxvc3QiOgkwLAoJCSJkaXNjYXJkIjoJMCwKCQkiZW1wdHkiOgkxNjkKCX0sCgkiRVJSU3RhdCI6CXsKCQkiZXJyIjoJMCwKCQkibGVuIjoJNDU5NTIwLAoJCSJzaWxlbmNlIjoJMAoJfSwKCSJydHBwU3RhdCI6CXsKCQkidGltZW91dCI6CTIwMDAsCgkJImJlc3RfY2hvaWNlIjoJIjAuMC4wLjAiCgl9Cn0="}',true);

do_curl($a_data);
function do_curl($data){
	$request = http_build_query($data);
	$ch = curl_init();
	curl_setopt($ch,CURLOPT_URL,'http://im.ailiaoba.net/cdr_log_test.php');
	//curl_setopt($ch,CURLOPT_URL,'http://localhost/mosheng/api/im/cdr_log.php');
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
