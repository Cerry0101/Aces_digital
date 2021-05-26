<?php

class Pcdc extends Connection{
    public function post(){
		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
            
        $this->idpcdc = @ $_POST['idpcdc'];
        $this->conjuge_id = @ $_POST['conjuge_id'];
        $this->laudo_conjuge = @ $_POST['laudo_conjuge'];
        
        if ($this->idpcdc){
            $this->dt_update = date('Y-m-d H:i:s');
            return self::update();
        }else{
            $this->idpcdc = self::create();
			return $this->idpcdc;
        }
    }

    public function put(){
        return $this->post();
    }

    public function get() {      
        $query = "SELECT * FROM pcdc";
        return self::read($query);
    }

}
