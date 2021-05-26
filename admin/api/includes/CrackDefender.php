<?php

class CrackDefender {

    private function __construct() {
        //
    }

    public static function postScript () {
        foreach($_REQUEST as $k=>$v){
            if( is_array($v) ) continue;
            if ( strpos( strtoupper($v), 'SCRIPT') !== false )  return TRUE;
        }
    }

}

if ( CrackDefender::postScript() ) {
    header( $_SERVER['SERVER_PROTOCOL'] . " 400 Bad Request");
    exit;
}
