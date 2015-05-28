<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/22
 * Time: 0:09
 */
include_once '../config.php';
$config=$blog_ftp;

$config_local = array(
	'base_path' =>'/data/wwwroot/mosheng/',
	'path_replace' =>array('api/trunk','api')
);
function my_ssh_disconnect($reason, $message, $language) {
	printf("Server disconnected with reason code [%d] and message: %s\n",
		$reason, $message);
}

$methods = array(
	'kex' => 'diffie-hellman-group1-sha1',
	'client_to_server' => array('crypt' => '3des-cbc','comp' => 'none'),
	'server_to_client' => array('crypt' => 'aes256-cbc,aes192-cbc,aes128-cbc','comp' => 'none')
);

$callbacks = array('disconnect' => 'my_ssh_disconnect');


$file_list = '/api/trunk/application/controllers/friend/sendflower.php
/api/trunk/application/helpers/memcache_keys_helper.php
/api/trunk/application/models/send_flower_model.php';
$file_list = explode(PHP_EOL,$file_list);

$connection = ssh2_connect($config['host'], $config['port'], $methods, $callbacks);
ssh2_auth_password($connection, $config['username'],$config['passwd']);
if (!$connection) die('Connection failed');
$sftp = ssh2_sftp($connection);


foreach($file_list as $file){
	if(isset($config_local['path_replace'])){
		$file = str_replace($config_local['path_replace'][0],$config_local['path_replace'][1],$file);
	}
	$file = trim($file);
	$file = ltrim($file,'/');
	$local_file = $config_local['base_path'].$file;
	$remote_file = $config['base_path'].$file;
	$file_info =pathinfo($remote_file);
	if(check_remote_dir($file_info['dirname'],$connection,$sftp,$config) ===false){
		if(ssh2_sftp_mkdir($sftp,$file_info['dirname'],0755,true)===false){
			debug_log('目录不存在且无法创建');
			exit();
		}
	}
	ssh2_scp_send($connection,$config_local['base_path'].$file,$config['base_path'].$file,$config['file_mod']);
}

function ssh_reconnect($config,$methods=array(),$callbacks=array()){
	if(($connection = ssh2_connect($config['host'],$config['port'],$methods,$callbacks))===false){
		debug_log('连接错误，请检查主机和端口配置');
		return false;
	}
	if(ssh2_auth_password($connection,$config['username'],$config['passwd'])===false){
		debug_log('连接错误，请检查用户名密码配置');
		return false;
	}
	return $connection;
}

function debug_log($message,$log_file='log.php'){
	is_string($message) or ($message = json_encode($message));
	$message = date('Y-m-d H:i:s').'-->'.$message.PHP_EOL;
	return file_put_contents($log_file,$message,FILE_APPEND);
}

function check_remote_dir($dir_name,&$connection,&$sftp,$config){
	$dir_stat = @ssh2_sftp_stat($sftp,$dir_name);
	if($dir_stat ===false){//要上传的文件所在的目录不存在
		if(($net = @ssh2_fingerprint($connection))===false){//检查是否是网络连接问题
			$j = 0;
			re_connect_ssh:
			if(($connection = ssh_reconnect($config)) ===false){
				if($j<3){
					sleep(1);
					goto re_connect_ssh;
				}
				debug_log('无法和主机连接，传输已停止');
				exit();
			}
		}
		if(ssh2_sftp_stat($sftp,$config['base_path']) ===false){//sftp连接错误
			$k = 0;
			re_connect_sftp:
			if(($sftp = ssh2_sftp($connection)) ===false){
				if($k<3){goto re_connect_sftp;}
				debug_log('无法和主机连接，传输已停止');
				exit();
			}
		}
		return false;
	}
	return true;
}