<?php
class a{
	public function aa(){
		return scandir('/var/www/test');
	}
}

class b{
	public function bb(){
		return new a();
	}
}

class c{
	var $b;
	public function cc(){
		$this->b = new b();
		if(empty($this->b->bb()->aa())){
			echo 'aaa';
		}else{
			echo 'bbb';
		}
	}
}
