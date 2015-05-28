<?php
/**
 * Created by PhpStorm.
 * User: xubandit
 * Date: 15/5/21
 * Time: 上午11:19
 */
$gift_array = file('./gradle-user-guide.txt');
$sql_o = "INSERT INTO `liaoba_payment_gift`( `name`,  `image`,  `price`, `jifen`, `enable`,  `dateline`)
VALUES ('礼物','%s',100,10,1,'%d');";
$time = time();
foreach($gift_array as $gift){
	$gift = trim($gift);
	$gift = 'http://boss.mosheng.mobi/uploads/vhuaboss/product/201505/'.$gift;
	$sql  = sprintf($sql_o,$gift,$time);
	echo $sql,PHP_EOL;
}