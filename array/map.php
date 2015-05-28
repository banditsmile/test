<?php
function cube($a,$b,$c)
{
    return array($a,$b,$c);
}

$a = array(1, 2, 3, 4, 5);
$c = $b = $a;
$d = array_map("cube", $a,$b,$c);
print_r($d);
