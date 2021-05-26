<?php

class Historico extends Connection {

	public function get() {
		//Validar o Token
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		//Comando SQL
		$query = "SELECT * FROM historico";

		//Log
		//$this->
		self::saveLog($query,$_user->idusuario);
		return self::read($query);
	}

	public function post() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idhistorico = @ $_POST['idhistorico'];
		$this->cadastro_id = @ $_POST['cadastro_id'];
		$this->historico = @ $_POST['historico'];
		
		if ( $this->idhistorico ) {
			$this->dt_update = date('Y-m-d H:i:s');
			self::saveLog("alterou historico #".$this->idhistorico, $_user->idusuario);
			return self::update();
		} else {
			$this->idhistorico = self::create();
			self::saveLog("inseriu historico #".$this->idhistorico, $_user->idusuario);
			return $this->idhistorico;
		}
		
	}

	public function put() {
		return self::post();
	}

	public function delete() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idhistorico = @ $_POST['idhistorico'];
		self::saveLog("deletou historico #".$this->idhistorico, $_user->idusuario);
		return self::del();
	}

}