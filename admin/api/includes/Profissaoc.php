<?php

class Profissaoc extends Connection{

    public function post(){
        

        if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

        $this->idprofissaoc = @ $_POST['idprofissaoc'];
        $this->conjuge_id = @ $_POST['conjuge_id'];
        $this->orgao_conjuge = @ $_POST['orgao_conjuge'];
        $this->ativo_conjuge = @ $_POST['ativo_conjuge'];
        $this->unidade_lotacao_conjuge = @ $_POST['unidade_lotacao_conjuge'];
        $this->municipio_lotacao_conjuge = @ $_POST['municipio_lotacao_conjuge'];
        $this->cargo_conjuge = @ $_POST['cargo_conjuge'];
        $this->dt_ingresso_conjuge = @ $_POST['dt_ingresso_conjuge'];  
        $this->invalido_conjuge = @ $_POST['invalido_conjuge'];  
        $this->renda_bruta_conjuge = @ $_POST['renda_bruta_conjuge'];
        
        if ( $this->idprofissaoc ){
            $this->dt_update = date('Y-m-d H:i:s');
			return self::update();
		} else {
			$this->idprofissaoc = self::create();
			return $this->idprofissaoc;

        }
    }

    public function get() {
	    $query = "SELECT * FROM profissaoc";
		return self::read($query);
	}

	public function put() {
		return self::post();
	}

}