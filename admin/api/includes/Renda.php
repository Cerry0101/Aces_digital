<?php

class Renda extends Connection{
    public function post(){
		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
            
        $this->idrenda = @ $_POST['idrenda'];
        $this->renda = @ $_POST['renda'];
        $this->profissao_id = @ $_POST['profissao_id'];
        
        if ($this->idrenda){
            $this->dt_update = date('Y-m-d H:i:s');
            return self::update();
        }else{
            $this->idrenda = self::create();
            return $this->idrenda;
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
