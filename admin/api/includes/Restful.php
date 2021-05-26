<?php

class RestFul {	

	public static function open() {

		$uri = explode('?', $_SERVER['REQUEST_URI']);
		$params = explode('/', trim($uri[0], '/'));
		array_shift($params);
		array_shift($params);
		
		$class = ucfirst(@ $params[0]);
		array_shift($params);
		$method = (isset($params[0]) ? $params[0] : $_SERVER['REQUEST_METHOD']);

		try {
			if (empty($class)) throw new Exception( "No content", 204 );
			if (! file_exists('includes/'.$class.'.php') ) throw new Exception( "File not found", 404 ); 
			include_once ('includes/'.$class.'.php');
			if (! class_exists($class)) throw new Exception( "Class not found", 404 );
			if (! method_exists($class, $method)) throw new Exception( "Method not found", 404 );
			$result = call_user_func(array(new $class, $method));
			return json_encode( $result );
		} catch (Exception $e) {
			header ( $_SERVER['SERVER_PROTOCOL'] .' '. $e->getCode() .' '. $e->getMessage() );
			exit;
		}
		
	}
}
