<?php
class father
{
    public function __construct()
    {
        $this->init();
    }

    private function init()
    {
        echo "father\n";
    }
}

class son extends father
{
	public function __construct(){

	}
    public function init()
    {
        echo "son\n";
    }
}

$son  = new son();
