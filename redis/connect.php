<?php
$redis = new Redis();
$redis->connect('10.1.2.194',6379);
$redis->auth('ailiaoba_2014_daydayup');
return $redis;
