<?php
 error_reporting(E_ALL & E_NOTICE & E_WARNING );
 session_start();
 if(!$_SESSION["autentificado"] || $_SESSION["autentificado"]==NULL){
    header("Location: salir.php");

 }
  
?>