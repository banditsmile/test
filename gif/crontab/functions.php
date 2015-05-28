<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 17/01/2015
 * Time: 18:22
 */

/**
 * @desc 获取gif图片地址和相关信息
 * @param string $page_url
 * @return array
 * @author bandit
 */
function get_image_info($page_url=''){
    $url  = $page_url ? $page_url : 'http://xx.yzz.cn/gif/2015-912360_50.shtml#article';
	if(!page_exists($url)){
		return false;
	}
    $html = file_get_html($url);
    $a = $html->find('table[id=wrapper] div a',0);
    $img = $html->find('table[id=wrapper] div a img',0);
    return array('url'=>$a->href,'url_little'=>$img->src,'title'=>$img->alt);
}

/**
 * @desc 获取当前系列的图片数量
 * @param string $article_url
 * @return mixed
 * @author bandit
 */
function get_article_images_num($article_url=''){
    $url  = $article_url ? $article_url : 'http://xx.yzz.cn/gif/2015-912360.shtml';
	if(!page_exists($url)){
		return false;
	}
    $html = file_get_html($url);
    $total_page_text = $html->find('div[class=page-number] ul li a',0)->plaintext;
    preg_match('/\d+/',$total_page_text,$match);
    return $match[0];
}

/**
 * @desc 获取一个系列的gif图片的页面地址
 * @param string $cat_url
 * @return array
 * @author bandit
 */
function get_article_list_info($cat_url=''){
	$data=array();

    $url  = $cat_url ? $cat_url : 'http://xx.yzz.cn/gif/';
	if(!page_exists($url)){
		return false;
	}
    $html = file_get_html($url);
    $current_page_list = $html->find('div[id=list] ul[class=list-pic2] li a');

    foreach($current_page_list as $page){
        $temp['title'] =$page->title;
        $temp['cover'] = $page->find('img',0)->src;
        $temp['url'] =$page->href;
        $data[]=$temp;
    }
    return $data;
}


function get_page_list_url($cat_url=''){
    $url  = $cat_url ? $cat_url : 'http://xx.yzz.cn/gif/';
	if(!page_exists($url)){
		return false;
	}
    $html = file_get_html($url);
    $current_page_list = $html->find('div[id=list] div[class=page-number] ul li a');
    $data=array();
    foreach($current_page_list as $page){
        $temp['title'] =$page->title;
	    $cover_img = $page->find('img',0);
	    if(is_object($cover_img)){
		    $temp['cover'] = $cover_img->src;
	    }else{
		    echo $page->href,PHP_EOL;
		    $temp['cover'] = '';
	    }

        $temp['url'] =$page->href;
        $data[]=$temp;
    }
    return $data;
}

function page_exists($url){
	$parts=parse_url($url);
	if(!$parts) return false; /* the URL was seriously wrong */

	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, $url);

	/* set the user agent - might help, doesn't hurt */
	curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)');
	curl_setopt($ch, CURLOPT_RETURNTRANSFER,1);

	/* try to follow redirects */
	curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);

	/* timeout after the specified number of seconds. assuming that this script runs
		on a server, 20 seconds should be plenty of time to verify a valid URL.  */
	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 15);
	curl_setopt($ch, CURLOPT_TIMEOUT, 20);

	/* don't download the page, just the header (much faster in this case) */
	curl_setopt($ch, CURLOPT_NOBODY, true);
	curl_setopt($ch, CURLOPT_HEADER, true);

	/* handle HTTPS links */
	if($parts['scheme']=='https'){
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,  1);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	}

	$response = curl_exec($ch);
	curl_close($ch);

	/*  get the status code from HTTP headers */
	if(preg_match('/HTTP\/1\.\d+\s+(\d+)/', $response, $matches)){
		$code=intval($matches[1]);
	} else {
		return false;
	};

	/* see if code indicates success */
	return (($code >=200) && ($code <= 400));
}

function get_image($image_url,$param=array()){
	if(!page_exists($image_url)){
		return false;
	}
	$dir = dirname(__FILE__).'/images/';
	$path_info = pathinfo($image_url);
	$images = file_get_contents($image_url);
	$fh = fopen($dir.$path_info['basename'],'w');
	fwrite($fh,$images);
	fclose($fh);
	return true;
}

function log_debug($file_name,$message){
	$dir = dirname(__FILE__).'/logs/';
	is_array($message) AND ($message  = json_encode($message));
	$message = date('Y-m-d H:i:s').'--'.$message.PHP_EOL;
	return file_put_contents($dir.$file_name.'.log',$message,FILE_APPEND);
}