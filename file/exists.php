<?php
echo '文件存在',str_repeat('-',20),PHP_EOL;
$start_time = array_sum(explode(' ',microtime()));
for($i=0;$i<10000;$i++){
	file_exists('./aa.txt');
}
$end_time = array_sum(explode(' ',microtime()));
echo 'file_exits :',($end_time-$start_time),PHP_EOL;


$start_time = array_sum(explode(' ',microtime()));
for($i=0;$i<10000;$i++){
    is_file('./aa.txt');
}
$end_time = array_sum(explode(' ',microtime()));
echo 'is_file :',($end_time-$start_time),PHP_EOL;

$start_time = array_sum(explode(' ',microtime()));
for($i=0;$i<10000;$i++){
    is_dir('./aa.txt');
}
$end_time = array_sum(explode(' ',microtime()));
echo 'is_dir :',($end_time-$start_time),PHP_EOL;

echo '文件不存在',str_repeat('-',20),PHP_EOL;

$start_time = array_sum(explode(' ',microtime()));
for($i=0;$i<10000;$i++){
    file_exists('./aa.bb');
}
$end_time = array_sum(explode(' ',microtime()));
echo 'file_exits :',($end_time-$start_time),PHP_EOL;


$start_time = array_sum(explode(' ',microtime()));
for($i=0;$i<10000;$i++){
    is_file('./aa.bb');
}
$end_time = array_sum(explode(' ',microtime()));
echo 'is_file :',($end_time-$start_time),PHP_EOL;

$start_time = array_sum(explode(' ',microtime()));
for($i=0;$i<10000;$i++){
    is_dir('./aa.bb');
}
$end_time = array_sum(explode(' ',microtime()));
echo 'is_dir :',($end_time-$start_time),PHP_EOL;
