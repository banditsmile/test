<?php
$a = array(//用户等级=>所需经验值,等级列表显示,每日对话人数（对陌生人）,上传照片张数
	1=>array('exp'=>300,'isShow'=>0,'message_num'=>5,'photos'=>8 ,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	2=>array('exp'=>1100,'isShow'=>0,'message_num'=>20,'photos'=>8,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1 ),
	3=>array('exp'=>1900,'isShow'=>0,'message_num'=>20,'photos'=>12,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	4=>array('exp'=>2900,'isShow'=>1,'message_num'=>20,'photos'=>12,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	5=>array('exp'=>4100,'isShow'=>1,'message_num'=>20,'photos'=>12,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	6=>array('exp'=>6500,'isShow'=>1,'message_num'=>20,'photos'=>16,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	7=>array('exp'=>8100,'isShow'=>1,'message_num'=>20,'photos'=>16,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	8=>array('exp'=>9900,'isShow'=>1,'message_num'=>20,'photos'=>16,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	9=>array('exp'=>11900,'isShow'=>1,'message_num'=>20,'photos'=>20,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	10=>array('exp'=>14100,'isShow'=>1,'message_num'=>20,'photos'=>20,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	11=>array('exp'=>16500,'isShow'=>1,'message_num'=>20,'photos'=>20,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	12=>array('exp'=>19100,'isShow'=>1,'message_num'=>20,'photos'=>20,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	13=>array('exp'=>21900,'isShow'=>1,'message_num'=>20,'photos'=>20,'credithigher'=>300,'creditlower'=>0,'lid'=>1,'level'=>1),
	14=>array('exp'=>24900,'isShow'=>1,'message_num'=>20,'photos'=>20,'lid'=>1,'level'=>1),
	15=>array('exp'=>28100,'isShow'=>1,'message_num'=>20,'photos'=>20,'lid'=>1,'level'=>1),
	16=>array('exp'=>31500,'isShow'=>1,'message_num'=>20,'photos'=>20,'lid'=>1,'level'=>1),
	17=>array('exp'=>35100,'isShow'=>1,'message_num'=>20,'photos'=>20,'lid'=>1,'level'=>1),
	18=>array('exp'=>38900,'isShow'=>1,'message_num'=>20,'photos'=>20,'lid'=>1,'level'=>1),
	19=>array('exp'=>42900,'isShow'=>1,'message_num'=>20,'photos'=>20,'lid'=>1,'level'=>1),
	20=>array('exp'=>47100,'isShow'=>1,'message_num'=>20,'photos'=>20),
	21=>array('exp'=>51500,'isShow'=>1,'message_num'=>20,'photos'=>20),
	22=>array('exp'=>56100,'isShow'=>1,'message_num'=>20,'photos'=>20),
	23=>array('exp'=>60900,'isShow'=>1,'message_num'=>20,'photos'=>20),
	24=>array('exp'=>65900,'isShow'=>1,'message_num'=>20,'photos'=>20),
	25=>array('exp'=>71100,'isShow'=>1,'message_num'=>20,'photos'=>20),
	26=>array('exp'=>76500,'isShow'=>1,'message_num'=>20,'photos'=>20),
	27=>array('exp'=>82100,'isShow'=>1,'message_num'=>20,'photos'=>20),
	28=>array('exp'=>87900,'isShow'=>1,'message_num'=>20,'photos'=>20),
	29=>array('exp'=>93900,'isShow'=>1,'message_num'=>20,'photos'=>20),
	30=>array('exp'=>100100,'isShow'=>1,'message_num'=>20,'photos'=>20)
);
$lower  =0;
echo '<?php'.PHP_EOL;
echo 'array('.PHP_EOL;
foreach($a as $key=>&$value){
	$value['lid']=$value['level']=$key;
	$value['credithigher']=$value['exp'];
	$value['creditlower']=$lower;
	$lower = $value['exp'];
	$str = $key.'=>array(\'exp\'=>'.$value['exp'].',\'isShow\'=>'.$value['isShow'].',\'message_num\'=>';
	$str .=$value['message_num'].',\'photos\'=>'.$value['photos'];
	$str .=',\'lid\'=>'.$key.',\'level\'=>'.$key.',\'credithigher\'=>'.$value['creditlower'];
	$str .=',\'creditlower\'=>'.$value['exp'].'),';
	$str .=PHP_EOL;
	echo $str;
}
echo ');'.PHP_EOL;
//var_export($a);
