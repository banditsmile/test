<?php
/**
 * Created by PhpStorm.
 * User: bandit
 * Date: 14/12/2014
 * Time: 17:54
 */
$a = array(0=>'a',1=>'b',3=>'d',4=>'f');
$b = array(0=>'a',1=>'b',2=>'c',4=>'f');
function compare($a,$b){
    echo $a,PHP_EOL;
    echo $b,PHP_EOL;
    if($a==$b){
        return 0;
    }else{
        return $a>$b ? 1:-1;
    }
}
$c = array_udiff($a,$b,'compare');
var_dump($c);
