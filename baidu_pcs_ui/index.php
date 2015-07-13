<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/30
 * Time: 下午11:11
 */
define('BASE_PATH',realpath(dirname(__FILE__)));
define('SMARTY_DIR',BASE_PATH.'/libs/smarty/');

include SMARTY_DIR.'/Smarty.class.php';


$smarty = new Smarty();
$smarty->setTemplateDir(BASE_PATH.'/template_c');

$smarty->assign('public_path',BASE_PATH.'/public');
$smarty->assign('body_name','body.html');

$smarty->display('index.html');
