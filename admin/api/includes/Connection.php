<?php

class Connection extends PDO {

    function __construct() {
        try {
            parent::__construct(DB_DSN, DB_USER, DB_PASSWD, array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8"));
            parent::setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            parent::setAttribute(PDO::ATTR_ORACLE_NULLS, PDO::NULL_EMPTY_STRING);    
        } catch ( PDOException $Exception ) {
            throw new Exception( $Exception->getMessage(), 500 );
        }
    }

	/* Metodos para CRUD */
	public function create() {
		$class = strtolower(get_class($this));
		$array_keys = array_keys(get_object_vars($this));
		$array_values = array_values(get_object_vars($this));
		$fields = null;
		$values = null;
		$size_keys = sizeof($array_keys);
		for ($i=0; $i<$size_keys; $i++) {
			if ( @ $array_values[$i] ) {
                if ($fields) $fields .= ",";
                $fields .= $array_keys[$i];
                if ($values) $values .= ",";
                $values .= "'".$array_values[$i]."'";
			}
        }
		http_response_code(201);
		parent::query( "INSERT INTO $class ($fields) VALUES ($values)" );
        return parent::lastInsertId();
    }

    public function read( $query ) {
        try {
			$ret = array();
            foreach (parent::query($query, PDO::FETCH_ASSOC) as $row) $ret[] = $row;
        } catch ( PDOException $Exception ) {
            throw new Exception( $Exception->getMessage(), 500 );
        }
		return $ret;
    }

	public function update( $condition=null ) {
		$class = strtolower(get_class($this));
		$array_keys = array_keys(get_object_vars($this));
		$array_values = array_values(get_object_vars($this));
		$expression = null;
		if ($size_keys = sizeof($array_keys)) $ret = $array_values[0];
		for ($i=0; $i<$size_keys; $i++) {
			if ( @ $array_values[$i] ) {
				if (!$condition) {
					$condition = $array_keys[$i] . "='" . $array_values[$i] . "'";
				}
				if ($expression) $expression .= ",";
				$expression .= $array_keys[$i] . "='" . $array_values[$i] . "'";
			}
		}
		
		parent::query( "UPDATE $class SET $expression WHERE $condition" );
		return @ $ret;
	}

	public function del( $condition=null ) {	
		$class = strtolower(get_class($this));
		$array_keys = array_keys(get_object_vars($this));
		$array_values = array_values(get_object_vars($this));
		if ($size_keys = sizeof($array_keys)) $ret = $array_values[0];
		if (!$condition) {
			for ($i=0; $i<$size_keys; $i++) {
				if ( @ $array_values[$i] ) {
					if ($condition) $condition .= " AND ";
					$condition .= $array_keys[$i] . "='" . $array_values[$i] . "'";
				}
			}
		}
		http_response_code(204);
		parent::query( "DELETE FROM $class WHERE $condition" );
		return @ $ret;
	}

	public function saveLog( $transacao, $idusuario ) {
        parent::query( "INSERT INTO transacao (transacao,usuario_id) VALUES (\"$transacao\",$idusuario)" );
    }

}