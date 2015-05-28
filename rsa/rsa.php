<?php
/**
 * @author alun (http://alunblog.duapp.com)
 * @version 1.0
 * @created 2013-5-17
 */
//openssl genrsa -out rsa_private_key.pem 1024
//openssl pkcs8 -topk8 -inform PEM -in rsa_private_key.pem -outform PEM -nocrypt -out private_key.pem
//openssl rsa -in rsa_private_key.pem -pubout -out rsa_public_key.pem
class Rsa{
private static $PRIVATE_KEY ;
private static $PUBLIC_KEY ;
    /**
    *返回对应的私钥
    */
    private static function getPrivateKey(){
        SELF::$PRIVATE_KEY = file_get_contents('./rsa_private_key.pem');
        $privKey = self::$PRIVATE_KEY;
         
        return openssl_pkey_get_private($privKey);      
    }

    /**
     *返回对应的私钥
     */
    private static function getPublicKey(){
        SELF::$PUBLIC_KEY = file_get_contents('./rsa_public_key.pem');
        $publicKey = self::$PUBLIC_KEY;

        return openssl_pkey_get_public($publicKey);
    }
 
    /**
     * 私钥加密
     */
    public static function privEncrypt($data)
    {
        if(!is_string($data)){
                return null;
        }           
        return openssl_private_encrypt($data,$encrypted,self::getPrivateKey())? base64_encode($encrypted) : null;
    }
    
    
    /**
     * 私钥解密
     */
    public static function privDecrypt($encrypted)
    {
        if(!is_string($encrypted)){
                return null;
        }
        return (openssl_public_decrypt(base64_decode($encrypted), $decrypted, self::getPublicKey()))? $decrypted : null;
    }
}

$source = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
echo $source,PHP_EOL;
$en = Rsa::privEncrypt($source);
echo $en,PHP_EOL;

$de = Rsa::privDecrypt($en);
echo $de,PHP_EOL;