<?php
$a = array(array('a'=>'b'),array('a'=>rand()));

function array_col($array,$key){
	return array_map(function($element,$key){return $element[$key];},$array,array_fill(0,count($array),$key));
}
var_dump(array_col($a,'a'));
