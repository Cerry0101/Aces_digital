<?php

class Moradia extends Connection{
    public function post(){
		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
            
        $this->idmoradia = @ $_POST['idmoradia'];
        $this->titular_id = @ $_POST['titular_id'];
        $this->municipio = ( $_POST['municipio']);
		$this->cep = ( $_POST['cep']);
		$this->bairro = ( $_POST['bairro']);
		$this->logradouro = ( $_POST['logradouro']);
		$this->numero_casa = ( $_POST['numero_casa']);
        $this->situacao = @ $_POST['situacao'];
        $this->tipo = @ $_POST['tipo'];
        $this->condicao = @ $_POST['condicao'];
        $this->caracteristica_uso = @ $_POST['caracteristica_uso'];
        $this->terreno = @ $_POST['terreno'];
        $this->area_risco = @ $_POST['area_risco'];
        $this->tipo_sinistro = @ $_POST['tipo_sinistro'];
        $this->numero_sinistro = @ $_POST['numero_sinistro'];
        $this->dt_emissao_sinistro = @ $_POST['dt_emissao_sinistro'];
        $this->tempo_moradia = @ $_POST['tempo_moradia'];
        $this->comodo = implode(',', @ $_POST['comodo']);
        $this->dt_update = @ $_POST['dt_update'];
        
        if ($this->idmoradia){
            $this->dt_update = date('Y-m-d H:i:s');
            return self::update();
        }else{
			return self::create();
        }
    }

    public function put(){
        return $this->post();
    }

    public function get() {      
        $query = "SELECT * FROM moradia";
        return self::read($query);
    }

}
