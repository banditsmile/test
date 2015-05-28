<?php

set_time_limit(0);
if( file_exists('private.key') )
{
    echo file_get_contents('private.key');
}
else
{
    include('Crypt/RSA.php');
    $rsa = new Crypt_RSA();
    $rsa->createKey();
    $res = $rsa->createKey();

    $privateKey = $res['privatekey'];
    $publicKey  = $res['publickey'];

    file_put_contents('public.key', $publicKey);
    file_put_contents('private.key', $privateKey);
}

?>