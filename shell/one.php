<?php
$content = date('H:i:s').'|'.$argv[1].PHP_EOL;
file_put_contents('./crontab.log',$content);
sleep(600);
