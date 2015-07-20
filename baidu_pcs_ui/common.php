<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/7/19
 * Time: 上午12:44
 */

error_reporting(E_ALL);
ini_set('display_errors','1');
define('BASE_PATH',realpath(dirname(__FILE__)));
define('DOWN_PATH','/data/hdd/public/baidu');
define('DOWN_STATUS',BASE_PATH.'/data/down_status');
include BASE_PATH.'/baidu_pcs.php';
include BASE_PATH.'/functions.php';
