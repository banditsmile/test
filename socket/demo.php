<?php
$ip = '127.0.0.1';
$port = '8080';
if(($sh = socket_create(AF_INET,SOCK_STREAM,SOL_TCP))<0){
    echo 'socket create failed',PHP_EOL;
    echo socket_strerror(socket_last_error($sh)),PHP_EOL;
}
if (!socket_set_option($sh, SOL_SOCKET, SO_REUSEADDR, 1)) {
    echo 'Unable to set option on socket: '. socket_strerror(socket_last_error()) . PHP_EOL;
}
if(socket_bind($sh,$ip,$port)<0){
    echo 'socket bind failed',PHP_EOL;
    echo socket_strerror(socket_last_error($sh)),PHP_EOL;
}
if(socket_listen($sh,5)===false){
    echo 'socket listen failed',PHP_EOL;
    echo socket_strerror(socket_last_error($sh)),PHP_EOL;
}
while(true){
    if(($sock_msg =socket_accept($sh))===false){
        echo 'no message accept',PHP_EOL;
        echo socket_strerror(socket_last_error($sh)),PHP_EOL;
        sleep(5);
    }
    $response = '连接成功'.PHP_EOL;
    socket_write($sh,$respons,strlen($response));
    $receive = socket_read($sh,1024);
    socket_write($sh,$receive.PHP_EOL,strlen($receive.PHP_EOL));
}
