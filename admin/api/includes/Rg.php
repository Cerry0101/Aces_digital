<?php

class Rg extends Connection{

    public function post(){
        if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
        
        $this->idrg = @ $_POST['idrg'];
        $this->titular_id = @ $_POST['titular_id'];    
        $this->base64_rg = @ $_POST['base64_rg'];

        if ( $this->idrg ){
            $this->dt_update = date('Y-m-d H:i:s');
			return self::update();
		} else {
			$this->idrg = self::create();
			return $this->idrg;
        }
    }

    public function get() {
		$query = "SELECT * FROM rg";
		return self::read($query);
	}

	public function put() {
		return self::post();
	}

}