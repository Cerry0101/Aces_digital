<?php

function sanitize($string, $replace="") {
        $string = iconv( "UTF-8" , "ASCII//TRANSLIT//IGNORE" , $string );
        $string = preg_replace( "/[^A-Za-z0-9\-\.\ ]/" , $replace, $string );
        return $string;
}