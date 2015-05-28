<?php
class timer {
	public $StartTime = 0;
	public $StopTime = 0;
	public $TimeSpent = 0;

	function start(){
		$this->StartTime = microtime();
	}

	function stop(){
		$this->StopTime = microtime();
	}

	function spent() {
		if ($this->TimeSpent) {
			return $this->TimeSpent;

		} else {

			$StartMicro = substr($this->StartTime,0,10);
			$StartSecond = substr($this->StartTime,11,10);
			$StopMicro = substr($this->StopTime,0,10);
			$StopSecond = substr($this->StopTime,11,10);
			$start = floatval($StartMicro) + $StartSecond;
			$stop = floatval($StopMicro) + $StopSecond;
			$this->TimeSpent = $stop - $start;

			return round($this->TimeSpent,8).'秒';
		}
	}

}

$timer = new timer;
$timer->start();
include_once '../config.php';
$mysql = new mysqli($db_wei_call_log['host'],$db_wei_call_log['user_name'],$db_wei_call_log['passwd'],$db_wei_call_log['db']);

/* 
$query = $mysql->query("select username,email from uc_members where uid < 100000"); 
$result = array(); 
while($result = $query->fetch_array()) 
{ 
   $result[] = array('name'=>$result['username'],'email'=>$result['email']); 
} 
*/
$query_prepare = $mysql->prepare("select udid,mac from tbl_recommend_log where id < ?");

$id = 3930;
$query_prepare->bind_param("i",$id);

$query_prepare->execute();
$query_prepare->bind_result($udid,$mac);

$result = array();
while($query_prepare->fetch())
{
	$result[] = array('name'=>$udid,'email'=>$mac);
}
echo count($result),PHP_EOL;
$timer->stop();
echo '</br>预查询mysql运行100000条数据时间为: '.$timer->spent(),PHP_EOL;
unset($timer);
//var_dump($result); 