<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/5/26
 * Time: 下午5:22
 */

error_reporting(E_ALL);
ini_set('display_errors','1');

function replace_hosts($ip_array,$host_file='/etc/hosts'){
	$hosts = file($host_file);
	$hosts = array_filter($hosts);
	foreach($hosts as $key=>&$host){
		if(strpos($host,'google.com')){
			unset($hosts[$key]);
			continue;
		}
		$host = trim($host);
	}
	$hosts_content = implode(PHP_EOL,$hosts);
	$hosts_content .=PHP_EOL;
	file_put_contents($host_file,$hosts_content);
	file_put_contents($host_file,$ip_array[0]."\t".'www.google.com'.PHP_EOL,FILE_APPEND);
	file_put_contents($host_file,$ip_array[1]."\t".'google.com'.PHP_EOL,FILE_APPEND);
}


include 'simple_html_dom/simple_html_dom.php';


if(filectime('./google-ip-discussion.html')-time()>21600){
	$url = 'http://www.iteblog.com/google-ip-discussion';
	$page_content = file_get_contents($url);
	file_put_contents('./google-ip-discussion.html',$page_content);
}


$page = file_get_html('./google-ip-discussion.html');

$lines = $page->find('pre',0);
$ip_str = trim($lines->innertext);
echo $ip_str,PHP_EOL;
$ip_array = explode(' ',$ip_str);
$ip_array = array_filter($ip_array);
$ip_array = array_values($ip_array);

replace_hosts($ip_array);

