<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 20/01/2015
 * Time: 14:42
 */
include('Crypt/RSA.php');

//header("Content-type: text/plain");

set_time_limit(0);
$rsa = new Crypt_RSA();
$rsa->setEncryptionMode(CRYPT_RSA_ENCRYPTION_OAEP);
$rsa->loadKey(file_get_contents('public.key')); // public key

$plaintext = 'Hello World!';
$ciphertext = $rsa->encrypt($plaintext);

echo base64_encode($ciphertext);
