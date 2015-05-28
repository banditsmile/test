<?php

function get_coordinate_by_ip($ip){
	$url = 'http://api.map.baidu.com/location/ip?ip='.$ip.'&ak=1ef32ef8843ad12b39997b80bd79d038&coor=bd09ll';
	$location = file_get_contents($url);
	$location_array = json_decode($location,true);
	if($location_array['status'] == 0){
		return $location_array['content']['point'];
	}
	return array();
}
var_dump(get_coordinate_by_ip($argv[1]));
