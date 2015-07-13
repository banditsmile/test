<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/6/30
 * Time: 下午11:11
 */
define('BASE_PATH',realpath(dirname(__FILE__)));
define('SMARTY_DIR',BASE_PATH.'/libs/smarty');

$smarty = new Smarty();
$smarty->setTemplateDir(BASE_PATH.'/template_c');

$smart->assign('public_path',BASE_PATH.'/public');