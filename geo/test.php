<?php
include('geohash.php');
$geohash=new Geohash;
$location = explode(',',$argv[1]);
$geohash_val = $geohash->encode($location[0],$argv[1]);
echo $geohash_val,PHP_EOL;
