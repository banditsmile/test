<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 2015/8/22
 * Time: 11:33
 */
date_default_timezone_set('Asia/Chongqing');
error_reporting(E_ALL);
ini_set('display_errors',1);

$phone = 13088803373;
$host = '127.0.0.1';
$port = '6379';
$redis = new Redis();
$redis->connect($host,$port);

#测试的集合数量
$total_key = 2000000;
$total_real_value = 0;
//通讯录的平均长度在20个左右
$average = 20;
#没添加1000个key做一次统计
$step =1000;
#1000个key总共的value数量
$total = $average*$step;

$value_start = 13000000000;
$value_rand_max = 1000000;
$sadd_start = array_sum(explode(" ",microtime()));
for($i=1;$i<=$total_key;$i++){

    $key = $phone+$i;
    $value_num = rand(1,2*$average);
    if($total>$value_num){
        $total-=$value_num;
    }else{
        $value_num=$total;
        $total=0;
    }
    $value_num==0 and $value_num=1;
    $param=array($key);
    for($j=0;$j<$value_num;$j++){
        $param[]= $value_start+rand(1,$value_rand_max);
    }
    call_user_func_array(array($redis,'sAdd'),$param);

    #每添加100集合进行一次测试
    if(($i%$step)==0){
        #记录内存使用量
        log_memory($redis);
        $total_real_value +=($step*$average-$total);
        $total=$step*$average;
        $test_key = $phone+rand(1,$i);
        $test_value = 13000000000+rand(1,1000000);
        $key_exist_start =  array_sum(explode(" ",microtime()));
        $redis->exists($phone+rand(1,$i));
        $key_exist_end =  array_sum(explode(" ",microtime()));

        $redis->sIsMember($test_key,$test_value);
        $value_exist_end =  array_sum(explode(" ",microtime()));

        #添加1000个集合消耗的时间
        log_debug($sadd_start,$key_exist_start,'sadd');
        #判断key存在耗时
        log_debug($key_exist_start,$key_exist_end,'key_exist');
        #判断value存在耗时
        log_debug($value_exist_end,$key_exist_end,'value_exist');


        $sadd_start = array_sum(explode(" ",microtime()));
    }
}
echo $total_real_value,PHP_EOL;


function log_debug($start,$end,$file){
    global $i;
    $log_path = '/var/www/test/redis/log/'.$file.'.log';
    $message = '%s %s %6d--> %s'.PHP_EOL;
    $message = sprintf($message,date('Y-m-d H:i:s'),$file,$i,$end-$start);
    file_put_contents($log_path,$message,FILE_APPEND);
}

function log_memory($redis){
    global $i;
    $log_path = '/var/www/test/redis/log/memory.log';
    $redis_info = $redis->info();
    $message = '%s %7d %10d -->%s'.PHP_EOL;
    $message = sprintf($message,date('Y-m-d H:i:s'),$i,$redis_info['used_memory'],$redis_info['used_memory_human']);
    file_put_contents($log_path,$message,FILE_APPEND);
}