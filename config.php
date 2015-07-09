<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/5/28
 * Time: 下午2:16
 */
$coco_vpn = array('username'=>'banditsmile@qq.com','password'=>'xulianhong','submit'=>'登录');

$blog_sftp =array(
	'username'=>'bandit',
	'passwd'=>'xulianhong',
	'host' => '42.121.85.26',
	'port' => 22,
	'base_path' =>'/home/bandit/ftp/test/',
	'file_mod' =>'0755'
);

$blog_ftp =array(
	'username'=>'bandit',
	'passwd'=>'xulianhong',
	'host' => '42.121.85.26',
	'port' => 21,
	'base_path' =>'/home/bandit/ftp/test/',
	'file_mod' =>'0755'
);
$local = array(
	'base_path'=>'/var/www/test/bootstrap',
	'file_mod' =>'0755'
);

$db_wei_call_log =array('host'=>'localhost','user_name'=>'root','passwd'=>'xulianhong','db'=>'wei_call_log');

$db_local = array('host'=>'localhost','user_name'=>'root','password'=>'xulianhong');

$host_116 = array(
	'username'=>'webtronics',
	'password'=>'liaoba.3501@',
	'host' => '10.1.2.116',
	'port' => 56822,
	'base_path' =>'/home/webtronics/htdocs/www/liaoba_boss/',
	'file_mod' =>0755
);

$connection = array(
	'default'=>array(
		'base_path'=>'/var/www/test/bootstrap/',
		'file_mod' =>'0755',
		'protocol' =>'file'
	),
	'blog_ftp'=>array(
		'username'=>'bandit',
		'passwd'=>'xulianhong',
		'host' => '42.121.85.26',
		'port' => 21,
		'base_path' =>'/home/bandit/ftp/test/',
		'file_mod' =>'0755',
		'protocol' =>'ftp'
	),
	'blog_ssh'=>array(
		'username'=>'bandit',
		'passwd'=>'xulianhong',
		'host' => '42.121.85.26',
		'port' => 22,
		'base_path' =>'/home/bandit/ftp/test/',
		'file_mod' =>'0755',
		'protocol' =>'ssh'
	)
);