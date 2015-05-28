<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/5/26
 * Time: 上午11:19
 */
$data = array('username'=>'banditsmile@qq.com','password'=>'xulianhong','submit'=>'登录');
$param = http_build_query($data);

$sh = curl_share_init();
curl_share_setopt($sh, CURLSHOPT_SHARE, CURL_LOCK_DATA_COOKIE);

$ch1 = curl_init();
$curl_array = array(
	CURLOPT_URL=>'http://www.cojs.net/client/dologin.php',
	CURLOPT_POST=>true,
	CURLOPT_POSTFIELDS=>$param,
	CURLOPT_RETURNTRANSFER=>TRUE,
	CURLOPT_SHARE=>$sh,
);

curl_setopt_array($ch1,$curl_array);
$result1 = curl_exec($ch1);


$ch2 = curl_init();
$curl_array = array(
	CURLOPT_URL=>'http://www.cojs.net/client/serverlist.php',
	CURLOPT_RETURNTRANSFER=>TRUE,
	CURLOPT_SHARE=>$sh,
);
curl_setopt_array($ch2,$curl_array);

$result2 = curl_exec($ch2);

$curl_errno = curl_errno($ch1);
$curl_error = curl_error($ch1);
echo "<pre>";
var_dump($curl_errno);
var_dump($curl_error);

echo "<br><hr>";
$curl_errno = curl_errno($ch2);
$curl_error = curl_error($ch2);
echo "<pre>";
var_dump($curl_errno);
var_dump($curl_error);

echo "<br><hr>";
$curl_errno = curl_errno($ch2);
$curl_error = curl_error($ch2);
echo "<pre>";
var_dump($curl_errno);
var_dump($curl_error);


curl_share_close($sh);

curl_close($ch1);
curl_close($ch2);

echo "<br><hr><br>";
echo "<pre>";
echo $result1;