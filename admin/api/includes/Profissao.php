<?php

class Profissao extends Connection{

    public function post(){
        

        if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

        $this->idprofissao = @ $_POST['idprofissao'];
        $this->titular_id = @ $_POST['titular_id'];
        $this->orgao = @ $_POST['orgao'];
        $this->ativo = @ $_POST['ativo'];
        $this->unidade_lotacao = @ $_POST['unidade_lotacao'];
        $this->municipio_lotacao = @ $_POST['municipio_lotacao'];
        $this->cargo = @ $_POST['cargo'];
        $this->dt_ingresso = @ $_POST['dt_ingresso'];  
        $this->invalido = @ $_POST['invalido'];  
        $this->renda_bruta = @ $_POST['renda_bruta'];
        
        if ( $this->idprofissao ){
            $this->dt_update = date('Y-m-d H:i:s');
			return self::update();
		} else {
			$this->idprofissao = self::create();
			return $this->idprofissao;

        }
    }

    public function get() {
	    $query = "SELECT * FROM profissao";
		return self::read($query);
	}

	public function put() {
		return self::post();
	}

}