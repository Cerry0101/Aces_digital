<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header('Content-Type: application/json; charset=utf-8');

include_once 'includes/config.php';
include_once 'includes/jwt.php';
include_once 'includes/CrackDefender.php';
include_once 'includes/Connection.php';
include_once 'includes/Restful.php';
echo Restful::open();