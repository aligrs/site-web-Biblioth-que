<?php

define ('HOST','localhost');
define ('DB_NAME','Bibliotheque');
define ('USER','etudiant');
define ('PASS','livre');

try{
	$db=new PDO("mysql:host=" . HOST . ";dbname=" . DB_NAME, USER , PASS);
	$db->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
	$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
      
} catch(PDOException $e){
 die('Erreur:' .$e->getMessage());
}




