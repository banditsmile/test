<?php
$print_char = '-';
$num = array();
for($i=1;$i<10;$i++){
	for($j=1;$j<10;$j++) {
		$zero[$i][$j] = $one[$i][$j] = ' ';
	}
}
$zero[1][5]=$zero[9][5]=$print_char;
$zero[2][4]=$zero[2][6]=$zero[8][4]=$zero[8][6]=$print_char;
$zero[3][3]=$zero[3][7]=$zero[7][3]=$zero[7][7]=$print_char;
$zero[6][2]=$zero[6][8]=$zero[4][2]=$zero[4][8]=$print_char;
$zero[5][1]=$zero[5][9]=$print_char;

for($i=1;$i<10;$i++){
	$one[$i][7]=$print_char;
}
$number=array(0=>$zero,1=>$one);
$num = 2;
for($times=0;$times<20;$times++){//多次输出,看起来像向右滚动
	for($i=1;$i<10;$i++){//输出一行
		echo str_repeat(' ',$times);//输出前面的空格,看起来像向右滚动
		for($k=0;$k<$num;$k++){//输出第N个数字
			for($j=1;$j<10;$j++){//输出数字的列
				echo $number[$k][$i][$j];
			}
		}
		echo chr(10);
	}
	echo chr(13);
	sleep(1);
}
