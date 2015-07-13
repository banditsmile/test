<?php
/**
 * created by phpstorm.
 * user: xubandit
 * date: 15/7/12
 * time: 上午12:24
 */
$context = file_get_contents('./.pcs/pcs.context');
echo "<pre>";
var_dump($context);

echo php_eol;
var_dump(json_decode($context,true));


var_export(array_keys(json_decode($context,true)));