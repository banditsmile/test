<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/30
 * Time: 下午11:11
 */
class base_controller{
	public function __construct(){

	}
}

class baidu_pcs_controller extends base_controller{

	var $baidu_pcs;
	var $default_download_path = DOWN_PATH;//默认下载目录
	public function __construct(){
		parent::__construct();
		$this->baidu_pcs = baidu_pcs::instance();
	}

	public function index(){
		return $this->render('list_body');
	}


	public function get_list(){
		$path = get_post('path');
		$path = rtrim($path,'/');

		$result = $this->baidu_pcs->get_list($path);
		$list = array();
		foreach($result as $item){
			$item['name'] = str_replace($path.'/','',$item['name']);
			$item['size'] = human_filesize($item['size'],0);
			$list[]=$item;
		}
		unset($result);
		if($path !='/' && $path !=''){
			$parent_dir = array('name'=>'..','size'=>'0B','date'=>max(array_column($list,'date')),'type'=>'d');
			array_unshift($list,$parent_dir);
		}
		return include BASE_PATH.'/templates/list.php';
	}

	public function download(){
		$file = rtrim(get_post('file'),'/ ');
		$path = trim(get_post('path'));

		//检查网盘是否存在该文件
		$file_info = $this->baidu_pcs->meta($file);
		if(empty($file_info) ){
			return json_output(101,'文件不存在');
		}
		if($file_info['Is Dir']=='Yes'){
			return json_output(101,'不支持目录下载');
		}

		//设置下载在路径
		$file_name = substr($file,strrpos($file,'/')+1);
		if(empty($path)){
			$path = $this->default_download_path.'/';
		}
		if(is_dir($path)){
			$path = rtrim($path,'/').'/'.$file_name;
		}

		if(file_exists($path)){
			return json_output(103,'下载位置已存在文件'.$path);
		}

		$down_info = $this->baidu_pcs->download($file,$path);
		if($down_info){
			$this->save_download_info($down_info);
			return json_output(0,'success',$down_info);
		}else{
			return json_output(104,'下载失败请重试');
		}
	}

	/**
	 * @param $data
	 * @return int
	 * @desc 记录下载信息
	 */
	private function save_download_info($data){
		$info_dir = BASE_PATH.'/data';
		if(!is_writable($info_dir)){
			return false;
		}
		$info_file = $info_dir.'/download.php';
		if(is_file($info_file)){
			$info = include $info_file;
		}else{
			$info = array();
		}
		$data['status']=0;//开始下载
		$info[md5($data['from'])]=$data;
		$info_str = '<?php'.PHP_EOL;
		$info_str .= 'return '.PHP_EOL;
		$info_str .=var_export($info,true);
		$info_str .=';';
		return file_put_contents($info_file,$info_str);
	}

	public function download_status(){
		$down_status = include BASE_PATH.'/data/download.php';
		$down_list = array();
		foreach($down_status as $status){
			if($status['status']==1 or is_file($status['to'])){
				$status['status']=1;//下载完成
			}else{
				$status['info']=file_get_contents($status['progress']);
			}
			$down_list[]=$status;
		}
		$this->render('download_body',array('down_list'=>$down_list));
	}

	public function download_info(){

	}

	public function render($template,$data=array()){
		include BASE_PATH.'/templates/header.php';
		extract($data);
		include BASE_PATH.'/templates/'.$template.'.php';
		include BASE_PATH.'/templates/footer.php';
		return true;
	}
}