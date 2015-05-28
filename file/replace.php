<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/4/29
 * Time: 下午8:10
 */
$base_dir = '/var/www/src/manual/manual/underscore/1.7.0';
$replace_from = 'http://www.css88.com/doc/underscore1.7.0/';
$replace_to = './';
$base_dir = '/var/www/src/manual/manual/python';
$replace_from = 'http://shouce.jb51.net/python/';
$replace_to = './';


function deal_dir($base_dir,$replace_from,$replace_to){
	$files = scandir($base_dir);
	$file_array = $dirs = array();

	foreach($files as $file){
		if($file == '.' || $file =='..'){continue;}
		$file_path = $base_dir.'/'.$file;
		if(is_dir($file_path)){
			$dirs[]=$file_path;
		}else{
			$file_array[]=$file_path;
		}
	}

	log_debug('scandir',array('dirs'=>$dirs,'file_array'=>$file_array));
	deal_files($file_array,$replace_from,$replace_to);
	if($dirs){
		$replace_to = $replace_to.'../';
		foreach($dirs as $dir){
			deal_dir($dir,$replace_from,$replace_to);
		}
	}else{
		return true;
	}
}
function deal_files($file_array,$replace_from,$replace_to){
	foreach($file_array as $file){
		if($f_old = file_get_contents($file)){
			$f_new = str_replace($replace_from,$replace_to,$f_old);
			if(is_string($f_new)){
				if(file_put_contents($file,$f_new)){
					log_debug('replace_success',$file);
				}else{
					log_debug('write_error',$file);
				}
			}else{
				log_debug('replace_error',$file);
			}
		}else{
			log_debug('read_error',$file);
		}
	}
}

function log_debug($file_name,$message){
	is_string($message) or ($message = json_encode($message));
	$file_name = __DIR__.'/log/'.$file_name.'.log';
	$message = date('Y-m-d H:i:s').'--->'.$message.PHP_EOL;
	return file_put_contents($file_name,$message,FILE_APPEND);
}

deal_dir($base_dir,$replace_from,$replace_to);
