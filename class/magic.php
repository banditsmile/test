<?php
class a{
    var $redis;
    var $redis_connected = false;
    public function __constuct(){
        $this->init();
    }

    public function init(){
        if(!$this->redis_connected){
            $this->redis = new Redis();
            $this->redis->connect('localhost');
            $this->redis_connected = true;
        }
    }
    public function __call($name,$argv){
        $method = array(
            0=>array('info'),
            1=>array('get'),
            2=>array('set'),
        );
        foreach($method as $key=>$value){
            if(in_array($name,$value)){
                if($key<=count($argv)){
                    if($this->redis_connected ==false){
                        $this->init();
                    }
                    $return =call_user_func_array(array($this->redis,$name),array_slice($argv,0,$key));
                    return $return;
                }
            }

        }
        return false;
    }
}

$a = new a();
$version = $a->info()['redis_version'];
echo $version;
