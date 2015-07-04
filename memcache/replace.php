<?php
$mem = new Memcache();
$mem->connect('10.1.3.196',11211);
var_dump($argv[1]);
var_dump(array_slice($argv,2));
var_dump(call_user_func_array(array($mem,$argv[1]),array_slice($argv,2)));
$mem->close();
