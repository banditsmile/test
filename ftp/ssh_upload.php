<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/22
 * Time: 18:47
 */

class ssh_upload {
	var $config=array(
		'username'=>'bandit',
		'passwd'=>'xulianhong',
		'host' => 'blog.icodeu.com',
		'port' => 22,
		'base_path' =>'/home/bandit/ftp/test/',
		'file_mod' =>0755
	);

	var $config_local = array(
		'base_path' =>'/data/wwwroot/mosheng/',
		'path_replace' =>array('api/trunk','api')
	);

	var $methods = array(
		'kex' => 'diffie-hellman-group1-sha1',
		'client_to_server' => array('crypt' => '3des-cbc','comp' => 'none'),
		'server_to_client' => array('crypt' => 'aes256-cbc,aes192-cbc,aes128-cbc','comp' => 'none')
	);

	var $callbacks = array('disconnect' => 'my_ssh_disconnect');
	var $uploaded = array();
	var $failed = array();

	public function __construct(){
		$this->connection = ssh2_connect($this->config['host'], $this->config['port'], $this->methods, $this->callbacks);
		ssh2_auth_password($this->connection, $this->config['username'],$this->config['passwd']);
		if (!$this->connection) die('Connection failed');
		$this->sftp = ssh2_sftp($this->connection);
		if (!$this->connection) die('Connection failed');
	}
	public function my_ssh_disconnect($reason, $message, $language) {
		printf("Server disconnected with reason code [%d] and message: %s\n",$reason, $message);
	}

	public function upload($file_list){
		is_array($file_list) or ($file_list = explode(PHP_EOL,$file_list));
		$file_list = array_filter($file_list);
		foreach($file_list as $file){
			$file_o = $file;
			if(isset($this->config_local['path_replace'])){
				$file = str_replace($this->config_local['path_replace'][0],$this->config_local['path_replace'][1],$file);
			}
			$file = trim($file);
			$file = ltrim($file,'/');
			$local_file = $this->config_local['base_path'].$file;
			$remote_file = $this->config['base_path'].$file;
			$file_info =pathinfo($remote_file);
			if($this->check_remote_dir($file_info['dirname'],$this->connection,$this->sftp,$this->config) ===false){
				if($this->ssh2_sftp_mkdir($this->sftp,$file_info['dirname'],0755,true)===false){
					$this->debug_log('目录不存在且无法创建');
					exit();
				}
			}
			if(ssh2_scp_send($this->connection,$local_file,$remote_file,$this->config['file_mod'])){
				$this->uploaded[]=$file_o;
			}else{
				$this->failed[]=$file_o;
			}
		}
	}


	public function ssh_reconnect(){
		if(($this->connection = ssh2_connect($this->config['host'],$this->config['port'],$this->methods,$this->callbacks))===false){
			$this->debug_log('连接错误，请检查主机和端口配置');
			return false;
		}
		if(ssh2_auth_password($this->connection,$this->config['username'],$this->config['passwd'])===false){
			$this->debug_log('连接错误，请检查用户名密码配置');
			return false;
		}
		return $this->connection;
	}

	public function debug_log($message,$log_file='log.php'){
		is_string($message) or ($message = json_encode($message));
		$message = date('Y-m-d H:i:s').'-->'.$message.PHP_EOL;
		if($this->uploaded || $this->failed){
			$message .='上传成功的文件:'.PHP_EOL.var_export($this->uploaded,true).PHP_EOL;
			$message .='上传失败的文件:'.PHP_EOL.var_export($this->failed,true).PHP_EOL;
		}

		return file_put_contents($log_file,$message,FILE_APPEND);
	}

	public function check_remote_dir($dir_name){
		$i = 0;
		check_dir:
		$dir_stat = @ssh2_sftp_stat($this->sftp,$dir_name);
		if($dir_stat ===false){//要上传的文件所在的目录不存在
			if($i>0){//已修复网络连接问题
				return false;
			}
			if(($ssh_stat = @ssh2_fingerprint($this->connection))===false){//检查是否是网络连接问题
				$j = 0;
				re_connect_ssh:
				if(($this->connection = $this->ssh_reconnect()) ===false){
					if($j<3){
						$j++;
						sleep(1);
						goto re_connect_ssh;
					}
					debug_log('无法和主机连接，传输已停止');
					exit();
				}
			}
			if(($ftp_stat = ssh2_sftp_stat($this->sftp,$this->config['base_path'])) ===false){//sftp连接错误
				$k = 0;
				re_connect_sftp:
				if(($this->sftp = ssh2_sftp($this->connection)) ===false){
					if($k<3){$k++;goto re_connect_sftp;}
					debug_log('无法和主机连接，传输已停止');
					exit();
				}
			}
			if($ssh_stat AND $ftp_stat){
				return false;
			}else{
				if($i<1){//网络问题已修复,重新判断文件夹是否存在
					$i++;
					goto check_dir;
				}
				return false;
			}
		}
		return true;
	}
}