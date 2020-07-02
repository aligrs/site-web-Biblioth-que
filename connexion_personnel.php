<?php

define ('HOST','localhost');
define ('DB_NAME','Bibliotheque');
define ('USER','admin');
define ('PASS','bibliotheque');

try{
	$dbb=new PDO("mysql:host=" . HOST . ";dbname=" . DB_NAME, USER , PASS);
	$dbb->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
	$dbb->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
      
} catch(PDOException $e){
 die('Erreur:' .$e->getMessage());
}