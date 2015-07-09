<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/30
 * Time: 下午11:11
 */
session_start();
define('BASE_PATH',realpath(dirname(__FILE__)));
include BASE_PATH.'/../config.php';
include BASE_PATH.'/config/constants.php';
include BASE_PATH.'/connection_manager.php';
include BASE_PATH.'/functions.php';

$left = conn_factory::get_instance($connection['default'],'default');
$right = conn_factory::get_instance($connection['blog_ftp'],'blog_ftp');

json_output(array('left'=>$left->get_list('/'),'right'=>$right->get_list('/')));