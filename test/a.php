<?php
function get_distance($lng1,$lat1,$lng2,$lat2,$miles=false){
		$pi80 = M_PI / 180;
		$lat1 *= $pi80;
		$lng1 *= $pi80;
		$lat2 *= $pi80;
		$lng2 *= $pi80;

		$r = 6380000; // mean radius of Earth in m
		$dlat = $lat2 - $lat1;
		$dlng = $lng2 - $lng1;
		$a = sin($dlat / 2) * sin($dlat / 2) + cos($lat1) * cos($lat2) * sin($dlng / 2) * sin($dlng / 2);
		$c = 2 * atan2(sqrt($a), sqrt(1 - $a));
		$km = $r * $c;

		return ($miles ? ($km * 0.621371192) : $km);
}
$lon1=113.939898;//126.63770727987;
$lat1 = 22.548011;//45.611746712731;
$lon2 = $argv[1];
$lat2 = $argv[2];
echo $lon2,"\t",$lat2,PHP_EOL;
echo get_distance($lon1,$lat1,$lon2,$lat2);
echo PHP_EOL;

//echo sprintf("round(6378.138*2*asin(sqrt(pow(sin( (%d*pi()/180-%d*pi()/180)/2),2)+cos(%d*pi()/180)*cos(%d*pi()/180)* pow(sin( (%d*pi()/180-%d*pi()/180)/2),2)))*1000)",$lat1,$lat2,$lat1,$lat2,$lon1,$lon2);
