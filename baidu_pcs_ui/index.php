<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/30
 * Time: 下午11:11
 */
error_reporting(E_ALL);
ini_set('display_errors','1');
define('BASE_PATH',realpath(dirname(__FILE__)));
include BASE_PATH.'/baidu_pcs.php';

$baidu_pcs = new baidu_pcs();


echo "<pre>";
echo $baidu_pcs->who(),PHP_EOL;
$list = $baidu_pcs->get_list('/2015-2');

var_dump($list[0]);
$body = 'main';
//include BASE_PATH.'/templates/index.php';
