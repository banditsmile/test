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
include BASE_PATH.'/file_manager.php';

$action = array('ls','cd');
$remote = new ftp_manager();