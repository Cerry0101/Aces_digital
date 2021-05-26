<?php

class Modalidade extends Connection {

	public function get() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		$query = "SELECT * FROM modalidade";

		self::saveLog($query,$_user->idusuario);

		return self::read($query);
	}

    public function obterModalidades() {
		$query = "SELECT idmodalidade, modalidade FROM modalidade";
		return self::read($query);
	}

	public function post() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idmodalidade = @ $_POST['idmodalidade'];
		$this->modalidade = addslashes(@ $_POST['modalidade']);
		$this->edital = addslashes(@ $_POST['edital']);
		$this->prazo = @ $_POST['prazo'];
		$this->vagas = @ $_POST['vagas'];
		if ( $this->idmodalidade ) {
			$this->dt_update = date('Y-m-d H:i:s');
			self::saveLog("alterou modalidade #".$this->idmodalidade, $_user->idusuario);
			return self::update();
		} else {
			$this->idmodalidade = self::create();
			self::saveLog("inseriu modalidade #".$this->idmodalidade, $_user->idusuario);
			return $this->idmodalidade;
		}
		
	}

	public function put() {
		return self::post();
	}

	public function delete() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idmodalidade = @ $_POST['idmodalidade'];
		self::saveLog("deletou modalidade #".$this->idmodalidade, $_user->idusuario);
		return self::del();
	}

}