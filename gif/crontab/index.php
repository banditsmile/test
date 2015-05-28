<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/3/6
 * Time: 18:58
 */
include 'simple_html_dom/simple_html_dom.php';
include 'functions.php';
$page_num = 1;
$limit =1;
$article_list_base_url = 'http://xx.yzz.cn/gif/5855,%d.shtml';

$mysqli = new mysqli('localhost','root','xulianhong');
$mysqli->query('set names utf8');
$mysqli->query('use images');
for($page_num=1;$page_num<=$limit;$page_num++){
	$article_list_url = sprintf($article_list_base_url,$page_num);
	$article_list_info = get_article_list_info($article_list_url);
	sleep(2);
	log_debug('yzz',$article_list_info);
	foreach($article_list_info as $article_info){
		log_debug('yzz',$article_info);
		$images_num = get_article_images_num($article_info['url']);
		sleep(2);
		log_debug('yzz','|images_num|'.$images_num);
		$image_page_url_info = pathinfo($article_info['url']);
		for($j=1;$j<10;$j++){
			if($j!=1){
				$image_page_url = str_replace('.'.$image_page_url_info['extension'],'_%d.'.$image_page_url_info['extension'],$article_info['url']);
				$image_page_url = sprintf($image_page_url,$j);
			}else{
				$image_page_url = $article_info['url'];
			}
			log_debug('yzz',$image_page_url);
			$image_info = get_image_info($image_page_url);
			sleep(2);
			log_debug('yzz',$image_info);
			get_image($image_info['url']);
			$sql = "insert into gif_info(url,url_little,title,page_url) values";
			$value = '("';
			$value .= implode('","',$image_info);
			$value .='","'.$image_page_url.'"';
			$sql .= $value.')';
			$mysqli->query($sql);
			log_debug('yzz',$sql);
		}
		exit();
	}
}
$mysqli->close();