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

	public function __construct(){
		parent::__construct();
	}

	public function index(){
		return include BASE_PATH.'/templates/index.php';
	}
	public function get_list(){
		$baidu_pcs = new baidu_pcs();

		$path = get_post('path');
		$path = rtrim($path,'/');

		$result = $baidu_pcs->get_list($path);
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
}