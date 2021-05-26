<?php

class Conjuge extends Connection {

	public function get() {
		$query = "SELECT * FROM conjuge";
		return self::read($query);
	}

	public function post() {
		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
		$this->idconjuge = @ $_POST['idconjuge'];
		$this->titular_id = @ $_POST['titular_id'];
		$this->nome_conjuge = (@ $_POST['nome_conjuge']);
		$this->sexo_conjuge = (@ $_POST['sexo_conjuge']);
		$this->cpf_conjuge = (@ $_POST['cpf_conjuge']);
		$this->rg_conjuge = $_POST['rg_conjuge'];
		$this->naturalidade_conjuge = $_POST['naturalidade_conjuge'];
		$this->orgao_exp_conjuge = (@ $_POST['orgao_exp_conjuge']);
		$this->dt_exp_conjuge = (@ $_POST['dt_exp_conjuge']);
		$this->escolaridade_conjuge = (@ $_POST['escolaridade_conjuge']);
		$this->pcd_conjuge = ( @ $_POST['pcd'] ? 'S' : 'N' );
		$this->tipo_pcd_conjuge = (@ $_POST['tipo_pcd_conjuge']);
		$this->cid_conjuge = (@ $_POST['cid_conjuge']);

		if ($this->idconjuge){
            $this->dt_update = date('Y-m-d H:i:s');
            return self::update();
        }else{
			return self::create();
        }
		
	}

	public function put() {
		return self::post();
	}

	public function delete() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idtitular = @ $_POST['idtitular'];
		self::saveLog("deletou titular #".$this->idtitular, $_user->idusuario);
		return self::del();
	}

}