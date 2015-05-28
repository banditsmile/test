<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/22
 * Time: 0:09
 */
$config=array(
	'username'=>'webtronics',
	'password'=>'liaoba.3501@',
	'host' => '10.1.2.116',
	'port' => 56822,
	'base_path' =>'/home/webtronics/htdocs/www/liaoba_boss/',
	'file_mod' =>0755
);

$config_local = array(
	'base_path' =>'/var/www/mosheng/boss/',
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


$file_list = trim(file_get_contents('116_source.txt'));
$file_list = explode(PHP_EOL,$file_list);

$connection = ssh2_connect($config['host'], $config['port'], $methods, $callbacks);
ssh2_auth_password($connection, $config['username'],$config['password']);
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
	if(is_dir($local_file)){continue;}//跳过文件列表里面的文件夹
	$file_info =pathinfo($remote_file);
	if(check_remote_dir($file_info['dirname'],$connection,$sftp,$config) ===false){
		if(ssh2_sftp_mkdir($sftp,$file_info['dirname'],0755,true)===false){
			debug_log('目录不存在且无法创建');
			exit();
		}
	}
	echo $local_file,PHP_EOL,$remote_file,PHP_EOL;
	if(ssh2_scp_send($connection,$local_file,$remote_file,$config['file_mod'])){
		$file_stat = ssh2_sftp_stat($sftp,$remote_file);
		echo format_shell_output($file_stat),PHP_EOL;
	}else{
		echo "文件上传失败:".$local_file,PHP_EOL;
	}
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

function format_shell_output($array){
	$result = var_export($array,true);
	$result = str_replace(PHP_EOL,"\t",$result);
	return $result;
}