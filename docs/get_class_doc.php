<?php
$input_file = $argv[1];
$input = file($input_file);
$result = array();
foreach($input as $record){
	$index = substr($record,0,strpos($record,'('));
	$result[strtolower($index)]=trim($record);
}
echo "<?php".PHP_EOL." return ",var_export($result).';';

