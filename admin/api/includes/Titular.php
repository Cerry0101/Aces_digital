<?php

class Titular extends Connection {

	public function get() {
		$query = "SELECT * FROM titular";
		return self::read($query);
	}

	public function post() {
		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
		$this->idtitular = ( $_POST['idtitular']);
		$this->nome = ( $_POST['nome']);
		$this->email = ( $_POST['email']);
		$this->contato = ( $_POST['contato']);
		$this->sexo = $_POST['sexo'];
		$this->cpf = $_POST['cpf'];
		$this->escolaridade = ( $_POST['escolaridade']);
		$this->rg = ( $_POST['rg']);
		$this->orgao_expedidor = ( $_POST['orgao_expedidor']);
		$this->dt_expedicao = ( $_POST['dt_expedicao']);
		$this->estado_civil = ( $_POST['estado_civil']);
		$this->dt_nascimento = ( $_POST['dt_nascimento']);
		$this->naturalidade = ( $_POST['naturalidade']);
		$this->pcd = ( @ $_POST['pcd'] ? 'S' : 'N' );
		$this->tipo_pcd = (@ $_POST['tipo_pcd']);
		$this->cid = (@ $_POST['cid']);

		if ($this->idtitular){
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