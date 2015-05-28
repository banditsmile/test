<?php
$data ='O:8:"stdClass":3:{s:3:"aaa";a:5:{i:0;i:1;i:1;i:2;i:2;s:39:"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";i:3;i:4;i:4;i:5;}s:3:"aaa";i:1;s:3:"ccc";R:5;}';
$x = unserialize($data);
var_dump($x);
?>
