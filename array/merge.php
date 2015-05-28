<?php
 $thumbnails = array( 
            array( "thumbnail" => "https://example1.png" ) ,
            array( "thumbnail" => "https://example2.png" ) ,
            array( "thumbnail" => "https://example3.png" ) ,            
  );

  $urls = array( 
            array( "url" => "http://www.example.com/1" ) ,
            array( "url" => "http://www.example.com/2" ) ,
            array( "url" => "http://www.example.com/3" ) ,          
  );
$thumbnails = array_combine(array_map(function($key){return 'key'.$key;},array_keys($thumbnails)),$thumbnails);
$urls = array_combine(array_map(function($key){return 'key'.$key;},array_keys($urls)),$urls);
var_dump(array_values(array_merge_recursive($thumbnails,$urls)));
