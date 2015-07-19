<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/30
 * Time: 下午11:11
 */
include 'common.php';
include 'controller.php';

$controller_name = 'baidu_pcs_controller';
$action = get_post('action');
empty($action) and $action='index';

$controller = new $controller_name();

call_user_func_array(array($controller,$action),array());
