<?php

class Rendac extends Connection{
    public function post(){
		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
            
        $this->idrendac = @ $_POST['idrendac'];
        $this->renda_conjuge = @ $_POST['renda_conjuge'];
        $this->profissaoc_id = @ $_POST['profissaoc_id'];
        
        
        if ($this->idrendac){
            $this->dt_update = date('Y-m-d H:i:s');
            return self::update();
        }else{
            $this->idrendac = self::create();
            return $this->idrendac;
        }
    }

    public function put(){
        return $this->post();
    }

    public function get() {      
        $query = "SELECT * FROM renda";
        return self::read($query);
    }

}
