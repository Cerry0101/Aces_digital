<?php

class Usuario extends Connection {

	public function get() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		$query = "SELECT * FROM usuario";
		if (@$_GET['id']) $query .= " WHERE idusuario=".$_GET['id']." LIMIT 1";
		if (@$_GET['nome']) $query .= " WHERE nome like '".$_GET['nome']."'";

		self::saveLog($query,$_user->idusuario);

		return self::read($query);
	}

	public function post() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idusuario = @ $_POST['idusuario'];
		$this->nome = addslashes(@ $_POST['nome']);
		$this->email = addslashes(@ $_POST['email']);
		$this->orgao = addslashes(@ $_POST['orgao']);
		$this->permissao = implode(',', @ $_POST['permissao']);
		$this->ativado = ( @ $_POST['ativado'] ? 'S' : 'N' );	
		if ( $this->idusuario ) {
			$this->dt_update = date('Y-m-d H:i:s');
			self::saveLog("alterou usuario #".$this->idusuario, $_user->idusuario);
			self::update();
		} else {
			$this->senha = md5($this->email);
			$this->idusuario = self::create();
			self::saveLog("inseriu usuario #".$this->idusuario, $_user->idusuario);
		}
		return array('idusuario' => $this->idusuario, 'ativado' => $this->ativado);
	}

	public function put() {
		return self::post();
	}

	public function delete() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idusuario = @ $_POST['idusuario'];
		self::saveLog("deletou usuario #".$this->idusuario, $_user->idusuario);
		return self::del();
	}

	public function autenticar () {
		include_once 'includes/recaptcha.php';
		// if ( ! recaptcha() ) throw new Exception("Bad Request", 400);

		if ( ! $_POST ) $_POST = json_decode( file_get_contents("php://input"), true );
		
		$email = addslashes(@$_POST['login']);
		$senha = md5(addslashes(@$_POST['password']));

		$query = "SELECT idusuario, nome, permissao, if(md5(email)=senha,true,false) mudasenha
		FROM usuario
		WHERE binary email='$email' and binary senha='$senha' and ativado='S'
		LIMIT 1";
		
		if ($result = self::read($query)) {
			$usuario = array_shift($result);
			self::saveLog('entrou',$usuario['idusuario']);
			return array('token' => createJWT($usuario));
		} else {
			http_response_code(401);
			return array();
		}
	}

	public function mudarSenha() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
		$query = "SELECT idusuario, nome, permissao
		FROM usuario
		WHERE binary idusuario='".$_user->idusuario."' and binary senha='".md5(addslashes($_POST['senha']))."' 
		LIMIT 1";

		if($result = self::read($query)) {
			$this->idusuario = $_user->idusuario;
			$this->senha = md5( addslashes ($_POST['novasenha']) );
	
			self::update();
			self::saveLog("mudou sua senha", $_user->idusuario);
	
			$usuario = array_shift($result);
			$usuario['mudasenha'] = false;
			return array('token' => createJWT($usuario));
		} else {
			return array();
		}
	}

	public function renovarSenha() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idusuario = @ $_POST['idusuario'];
		$this->email = addslashes(@ $_POST['email']);
	
		if ( $this->idusuario ) {
			$this->senha = md5($this->email);
			$this->dt_update = date('Y-m-d H:i:s');
			self::saveLog("renovou senha do usuario #".$this->idusuario, $_user->idusuario);
			return self::update();
		}
	}

}