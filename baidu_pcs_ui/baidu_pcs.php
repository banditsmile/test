<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/30
 * Time: 下午11:11
 */
class baidu_pcs_sdk{
	public function __construct(){

	}
}
class baidu_pcs extends baidu_pcs_sdk{
	public function __construct(){
		parent::__construct();
	}

	public function init(){

	}
	public function index(){
		$result = exec('pcs list',$output,$return);
		$shell_result = shell_exec('pcs list');
		$exec_result = array('result'=>$result,'output'=>$output,'return'=>$return);
		return array('shell_result'=>$shell_result,'exec_result'=>$exec_result);
	}

	public function context($key=''){
		$command = 'pcs context';
		$result = exec($command,$output,$return);
		$context = array();
		foreach($output as $o){
			$o = str_replace(array("\""," ","{","}",","),'',$o);
			$o = trim($o,"\t");
			if(strlen($o)){
				$o_array = explode("\t",$o);
				$context[trim($o_array[0],": ")]= isset($o_array[1]) ? trim($o_array[1]) : '';
			}

		}
		if(!empty($key)){
			if(isset($context[$key])){
				return $context[$key];
			}else{
				return false;
			}
		}
		return $context;
	}

	public function set_context($key,$value){
		$context_fields = array (
			0 => 'cookiefile',
			1 => 'captchafile',
			2 => 'workdir',
			3 => 'list_page_size',
			4 => 'list_sort_name',
			5 => 'list_sort_direction',
			6 => 'secure_method',
			7 => 'secure_key',
			8 => 'secure_enable',
			9 => 'timeout_retry',
			10 => 'max_thread',
			11 => 'max_speed_per_thread',
		);
		if(!in_array($key,$context_fields)){
			return false;
		}
		$command = "pcs set --%s=%s";
		$command = sprintf($command,$key,$value);
		$result = exec($command,$output,$return);
		if($return===0){
			return true;
		}else{
			return false;
		}
	}

	public function login(){
		$username = trim(get_post('username'));
		$password = trim(get_post('password'));
		if(empty($username) || empty($password)){
			return json_output(101,'用户名或密码不能为空');
		}

		$command = 'pcs login --username=%s --password=%s';
		$command = sprintf($command,$username,$password);
		$result = exec($command,$output,$return);
		if($return===0){
			$result_array=explode(' ',$result);
			$uid = array_pop($result_array);
			return json_output(0,'uid '.$uid);
		}else{
			return json_output(101,'登陆失败');
		}
	}

	public function logout(){
		$command = 'pcs logout';
		$result = exec($command,$output,$return);
		if($return === 0){
			return json_output(0,'登出成功');
		}else{
			return json_output(101,'登出失败');
		}

	}

	/**
	 * @return bool|string
	 * @desc 查看当前登陆用户，未登陆返回false;
	 */
	public function who(){
		$command = "pcs who";
		$result = exec($command,$output,$return);
		if($return===0){
			return $result;
		}else{
			return false;
		}
	}

	public function meta($path){
		$command = 'pcs meta %s';
		$command = sprintf($command,$path);
		$result = exec($command,$output,$return);
		if($return !==0){
			return false;
		}
		$meta = array();
		foreach($output as $o){
			$o_array = explode("\t",trim($o));
			$meta[trim($o_array[0],": ")]=trim($o_array[1]);
		}
		return $meta;
	}

	public function get_list($path){
		if($path !='' and $path !='/'){
			$meta = $this->meta($path);
			if(empty($meta) or ($meta['Is Dir']==="No")){
				return false;
			}
		}

		$page_size = $this->context('list_page_size');
		$this->set_context('list_page_size',9999);
		$command = 'pcs list %s';
		$command = sprintf($command,$path);
		$result = exec($command,$output,$return);
		$this->set_context('list_page_size',$page_size);

		if($return !==0){
			return false;
		}
		$output = array_slice($output,3,-4);//去前三行和后三行的描述信息
		$list = array();
		foreach($output as $out){
			$row = array_filter(explode(" ",$out),function($a){ return strlen($a)>0;});
			$a = array();
			list($a['type'],$a['size'],$a['date'],$a['time'],$a['name'])=array_values($row);
			$list[]=$a;
		}
		return $list;
	}

	/**
	 * @param $from
	 * @param $to
	 * @param bool|false $force
	 * @return array|bool
	 * @desc 下载文件并返回下载状态信息
	 */
	public function download($from,$to,$force=false){
		$force = $force?' -f':'';
		$status_file = time().'_'.rand(1,100).'.log';//通过该文件可以获取下载状态
		$command = "pcs download %s %s >  %s &";
		$command = sprintf($command,$force,$from,$to);
		$proc = proc_open($command,array(),$pipes,null);
		if(!is_resource($proc)){
			return false;
		}
		$proc_status = proc_get_status($proc);
		$down_info = array(
			'command'=>$proc_status['command'],
			'pid'=>$proc_status['pid'],//用来停止下载
			'progress'=>$status_file
		);
		proc_close($proc);
		return $down_info;
	}
}

