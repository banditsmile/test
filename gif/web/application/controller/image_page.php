<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/11
 * Time: 22:13
 */

class image_page extends controller {
	public function __construct(){
		parent::__construct();
	}
	public function index(){

	}
	public function next(){
		$image_id = trim(get_post('image_id'));
		if(empty($image_id)){return false;}
		$image_model = new image_model();
		$next_image = $image_model->get_next();
	}

}