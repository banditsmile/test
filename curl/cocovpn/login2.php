<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/5/26
 * Time: 下午5:22
 */

error_reporting(E_ALL);
ini_set('display_errors','1');


//模拟登录
function login_post($url, $cookie, $post) {
	$curl = curl_init();//初始化curl模块
	curl_setopt($curl, CURLOPT_URL, $url);//登录提交的地址
	curl_setopt($curl, CURLOPT_HEADER, 0);//是否显示头信息
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, 0);//是否自动显示返回的信息
	curl_setopt($curl, CURLOPT_COOKIEJAR, $cookie); //设置Cookie信息保存在指定的文件中
	curl_setopt($curl, CURLOPT_POST, 1);//post方式提交
	curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($post));//要提交的信息
	curl_exec($curl);//执行cURL
	curl_close($curl);//关闭cURL资源，并且释放系统资源
}

//登录成功后获取数据
function get_content($url, $cookie) {
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);
	curl_setopt($ch, CURLOPT_HEADER, 0);
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	curl_setopt($ch, CURLOPT_COOKIEFILE, $cookie); //读取cookie
	$rs = curl_exec($ch); //执行cURL抓取页面内容
	curl_close($ch);
	return $rs;
}

/**
 * @param $html_content
 * @return array
 * @desc 解析页面上的ip列表
 */
function get_server_list($html_content){
	include 'simple_html_dom/simple_html_dom.php';

	$page = str_get_html($html_content);

	$tbody = $page->find('div.main table tbody',0);

	$i = 0;
	$data = array();
	foreach($tbody->find('tr') as $tr){
		if($i++===0){continue;}

		$tds = $tr->find('td');
		$data[]=array('domain'=>$tds[1]->innertext,'ip'=>$tds[2]->innertext);
	}
	return $data;
}



$f_ctime = filectime('./list.html');
if(time()-$f_ctime>86400){
	$login_url = 'http://www.cojs.net/client/dologin.php';
	$cookie_file = __DIR__.'/cocovpn.cookie';
	$post = array('username'=>'banditsmile@qq.com','password'=>'xulianhong','submit'=>'登录');

	login_post($login_url,$cookie_file,$post);

	$list_url = 'http://www.cojs.net/client/serverlist.php';
	$result = get_content($list_url,$cookie_file);
	file_put_contents('./list.html',$result);
}else{
	$result = file_get_contents('./list.html');
}

$data = get_server_list($result);



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

$info = array();
foreach($data as $server){
	$pid = pcntl_fork();
	if($pid){
		echo 'main thread start',PHP_EOL;
		echo "<pre>";
		var_dump($info,true);
	}else{
		exec('ping -c 1 '.$server['ip'],$result);
		//echo $server['domain'].' '.$server['ip'].' '.$result[1].PHP_EOL;
		if(is_array($result)){$info[]=array_merge($server,$result);}
		exit();
	}
}
