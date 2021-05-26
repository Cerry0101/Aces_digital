<?php

class Pcd extends Connection{
    public function post(){
		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
            
        $this->idpcd = @ $_POST['idpcd'];
        $this->titular_id = @ $_POST['titular_id'];
        $this->laudo = @ $_POST['laudo'];
        
        if ($this->idpcd){
            $this->dt_update = date('Y-m-d H:i:s');
            return self::update();
        }else{
            $this->idpcd = self::create();
			return $this->idpcd;
        }
    }

    public function put(){
        return $this->post();
    }

    public function get() {      
        $query = "SELECT * FROM Pcd";
        return self::read($query);
    }

}
