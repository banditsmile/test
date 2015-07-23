<?php
$fh = fopen('f.php','r');
$i = -3;
var_dump(fseek($fh,$i,SEEK_END));
if(fseek($fh,$i,SEEK_END)===0){
    echo fgetc($fh),PHP_EOL;
}else{
    echo 'wrong',PHP_EOL;
}
fclose($fh);
