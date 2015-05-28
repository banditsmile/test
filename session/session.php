<?php
session_start();
var_dump($_SESSION);
var_dump($_GET);
echo PHP_EOL;
isset($_SESSION['count'])? $_SESSION['count']++:$_SESSION['count']=1;
echo '$_GET value',PHP_EOL;
var_dump($_SESSION);
echo PHP_EOL;
echo '$_GET value',PHP_EOL;
isset($_GET['count']) ? $_GET['count']++:$_GET['count']=1;
var_dump($_GET);
