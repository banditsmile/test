<?php

$dir_name = dirname(__FILE__);

require($dir_name.'/json-rpc/json-rpc.php');

if (function_exists('xdebug_disable')) {
    xdebug_disable();
}

include '../../config.php';
@mysql_connect($db_local['host'], $db_local['user_name'], $db_local['password']);
@mysql_select_db('hotel');

class MysqlDemo {
  public function query($query) {
    if (preg_match("/create|drop/", $query)) {
      throw new Exception("Sorry you are not allowed to execute '" . 
                          $query . "'");
    }
    if (!preg_match("/(select.*from *user*|insert *into *user*.*|delete *from *user*|update *user*)/", $query)) {
      throw new Exception("Sorry you can't execute '" . $query .
                          "' you are only allowed to select, insert, delete " .
                          "or update 'test' table");
    }
    if ($res = mysql_query($query)) {
      if ($res === true) {
        return true;
      }
      if (mysql_num_rows($res) > 0) {
        while ($row = mysql_fetch_row($res)) {
          $result[] = $row;
        }
        return $result;
      } else {
        return array();
      }
    } else {
      throw new Exception("MySQL Error: " . mysql_error());
    }
  }
}

handle_json_rpc(new MysqlDemo());

?>
