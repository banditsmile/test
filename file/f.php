<?php
$i=0;
$j=0;
$k=0;
while($i<400){
	$i++;
	$j++;
	echo 'O';
	if($j==20){
		$k++;
		echo chr(13);
		$j=0;
		sleep(1);
	}
}
