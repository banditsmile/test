<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 12/12/2014
 * Time: 23:53
 */
/**
 * 发送HTTP状态
 * @param integer $code 状态码
 * @return void
 */
function http_status($code) {
    static $_status = array(
        // Informational 1xx
        100 => 'Continue',
        101 => 'Switching Protocols',
        // Success 2xx
        200 => 'OK',
        201 => 'Created',
        202 => 'Accepted',
        203 => 'Non-Authoritative Information',
        204 => 'No Content',
        205 => 'Reset Content',
        206 => 'Partial Content',
        // Redirection 3xx
        300 => 'Multiple Choices',
        301 => 'Moved Permanently',
        302 => 'Moved Temporarily ', // 1.1
        303 => 'See Other',
        304 => 'Not Modified',
        305 => 'Use Proxy',
        // 306 is deprecated but reserved
        307 => 'Temporary Redirect',
        // Client Error 4xx
        400 => 'Bad Request',
        401 => 'Unauthorized',
        402 => 'Payment Required',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        406 => 'Not Acceptable',
        407 => 'Proxy Authentication Required',
        408 => 'Request Timeout',
        409 => 'Conflict',
        410 => 'Gone',
        411 => 'Length Required',
        412 => 'Precondition Failed',
        413 => 'Request Entity Too Large',
        414 => 'Request-URI Too Long',
        415 => 'Unsupported Media Type',
        416 => 'Requested Range Not Satisfiable',
        417 => 'Expectation Failed',
        // Server Error 5xx
        500 => 'Internal Server Error',
        501 => 'Not Implemented',
        502 => 'Bad Gateway',
        503 => 'Service Unavailable',
        504 => 'Gateway Timeout',
        505 => 'HTTP Version Not Supported',
        509 => 'Bandwidth Limit Exceeded'
    );
    if(isset($_status[$code])) {
        debug('http',$_status[$code]);
        header('HTTP/1.0 '.$code.' '.$_status[$code]);
        // 确保FastCGI模式下正常
        header('Status:'.$code.' '.$_status[$code]);
        //http_response_code($code);
        echo 'HTTP/1.0 '.$code.' '.$_status[$code];
        echo PHP_EOL;
        echo 'Status:'.$code.' '.$_status[$code];
        exit();
    }
}
error_reporting(E_ALL);
function debug($file,$content){
    is_string($content) OR $content = json_encode($content);
    file_put_contents($file,date('Y-m-d H:i:s').'|'.$content.PHP_EOL,FILE_APPEND);
}
if(isset($_REQUEST['code'])){
    http_status($_REQUEST['code']);
}