<?php

class Enfermidadec extends Connection{

    public function post(){
        if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
        
        $this->idenfermidadec = @ $_POST['idenfermidadec'];
        $this->profissaoc_id = @ $_POST['profissaoc_id'];    
        $this->enfermidade_conjuge = @ $_POST['enfermidade_conjuge'];    
            
        if ($this->idenfermidadec){
            $this->dt_update = date('Y-m-d H:i:s');
            return self::update();
        }else{
            $this->idenfermidadec = self::create();
			return $this->idenfermidadec;
        }

    }

    public function get() {
		$query = "SELECT * FROM enfermidade";
		return self::read($query);
	}

	public function put() {
		return self::post();
	}

}