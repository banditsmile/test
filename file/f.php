<?php
$fh = fopen('http://220.231.198.116/liaoba_boss//uploads/vhuaboos/BetaVersion/201502/6642243061cf5d0257fa0271c1498abd.apk','r');
$a = fread($fh,16);
fclose($fh);
var_dump($a);
