<?php

# seta o PHP.INI
ini_set("default_charset", "UTF-8");
ini_set("date.timezone", "America/Belem");
ini_set("display_errors", true);
ini_set("memory_limit", "1024M");
ini_set("upload_max_filesize", "1024M");
ini_set("post_max_size", "2048M");
ini_set("max_execution_time", "60");
ini_set("max_input_time", "60");

# define os parametros de conexão com o banco de dados
define('DB_DSN','mysql:host=localhost:3306;dbname=digital');
define('DB_USER','root');
define('DB_PASSWD','123456');

define('SMTP_HOST','mail.user.br');
define('SMTP_PORT',587);
define('SMTP_AUTH',true);
define('SMTP_USER','ufra@ufra.pa.gov.br');
define('SMTP_PASSWD','user102030');
define('SMTP_FROM','ufra@ufra.pa.gov.br');
define('SMTP_FROM_NAME','Inscrição para Evento/AULA');

# define a chave privada para Json Web Token - JWT
define("PRIVATE_KEY", "chavePrivadaParaJsonWebTokenLOCKDOWN");
# define chave recaptcha
define('SECRETKEY_RECAPTCHA','6Lcf_e8ZAAAAAJ75198up1F1srAIeItrMIGni39D');
