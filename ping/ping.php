<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/3/27
 * Time: 下午2:30
 */
$data = array(
	array('VIP荷兰线路01','nl01.yyuu.me','81.4.105.195','4122或3108'),
	array('VIP法国线路01','fr01.yyuu.me','176.31.206.242','4122或3108'),
	array('VIP意大利线路01','it01.yyuu.me','37.247.48.226','4122或3108'),
	array('VIP新加坡线路01','sg01.yyuu.me','128.199.69.209','4122或3108')
);


//配合pcntl_signal使用
declare(ticks=1);
//最大的子进程数量
$max = count($data);
//当前的子进程数量
$child = 0;

//当子进程退出时，会触发该函数
function sig_handler($sig) {
	switch($sig) {
		case SIGCHLD:
			//do something
	}
}

//注册子进程退出时调用的函数
pcntl_signal(SIGCHLD, "sig_handler");
foreach($data as $server){
	$pid = pcntl_fork();
	if($pid){
		//echo 'main thread start',PHP_EOL;
	}else{
		exec('ping -c 1 '.$server[2],$result);
		echo $server[1].' '.$server[2].' '.$result[1],PHP_EOL;
		exit();
	}
}