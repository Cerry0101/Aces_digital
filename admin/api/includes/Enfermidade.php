<?php

class Enfermidade extends Connection{

    public function post(){
        if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
        
        $this->idenfermidade = @ $_POST['idenfermidade'];
        $this->profissao_id = @ $_POST['profissao_id'];    
        $this->enfermidade = @ $_POST['enfermidade'];    
            
        if ($this->idenfermidade){
            $this->dt_update = date('Y-m-d H:i:s');
            return self::update();
        }else{
            $this->idenfermidade = self::create();
			return $this->idenfermidade;
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