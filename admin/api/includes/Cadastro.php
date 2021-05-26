<?php

class Cadastro extends Connection {

	public function get() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		$query = "SELECT * FROM cadastro";

		self::saveLog($query,$_user->idusuario);

		return self::read($query);
	}

	public function post() {
		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );
		//Salvar Titular
        require_once('Titular.php'); 
        $titular = new Titular();
        $_POST['titular_id'] = @ $titular->post();

		//Salvar RG
		require_once('Rg.php');
        $rg = new Rg();
        $rg->post();
		
		//Salvar PCD titular
		$_POST['pcd'] = ( @ $_POST['pcd'] ? 'S' : 'N' );
		if($_POST['pcd'] == 'S') {
            require_once('Pcd.php');
            $pcd = new Pcd();
            $pcd->post();
        }

		if($_POST['estado_civil'] == 'Casado' || $_POST['estado_civil'] == 'União estável') {
			//Salvar Conjuge
			require_once('Conjuge.php');
			$_conjuge = new Conjuge();
			$_POST['conjuge_id'] = $_conjuge->post();
			
			//Salvar Conjuge PCD
			$_POST['pcd_conjuge'] = ( @ $_POST['pcd_conjuge'] ? 'S' : 'N' );
			if($_POST['pcd_conjuge'] == 'S') {
				require_once('Pcdc.php');
				$_pcdc = new Pcdc();
				$_pcdc->post();
			}

			// Salvar profissao conjuge
			require_once('Profissaoc.php');
			$_profissaoc = new Profissaoc();
			$_POST['profissaoc_id'] = $_profissaoc->post();

			//Salvar renda do conjuge
			require_once("Rendac.php");
			$_rendac = new Rendac();
			$_rendac->post();

			if($_POST['invalido_conjuge'] == 'S'){
				//Salvar Enfermidade
				require_once("Enfermidadec.php");
				$_enfermidadec = new Enfermidadec();
				$_enfermidadec->post();
			}

		}

		//Salvar Moradia
		require_once('Moradia.php');
		$_moradia = new Moradia();
		$_moradia->post();

		//Salvar profissao
		require_once('Profissao.php');
		$_profissao = new Profissao();
		$_POST['profissao_id'] = $_profissao->post();

		//Salvar renda do titular
		require_once("Renda.php");
		$_renda = new Renda();
		$_renda->post();

		if($_POST['invalido'] == 'S'){
			//Salvar Enfermidade
			require_once("Enfermidade.php");
			$_enfermidade = new Enfermidade();
			$_enfermidade->post();
		}

        $this->modalidade_id = $_POST['modalidade_id'];
		$this->titular_id = $_POST['titular_id'];
        $this->idcadastro = self::create();

        return $this->idcadastro;
		
	}

	public function put() {
		return self::post();
	}

	public function delete() {
		$_token = validateHTTPAuthorization();
		$_user = json_decode($_token->data);

		if (! $_POST) $_POST = json_decode( file_get_contents("php://input"), true );

		$this->idcadastro = @ $_POST['idcadastro'];
		self::saveLog("deletou cadastro #".$this->idcadastro, $_user->idusuario);
		return self::del();
	}

}