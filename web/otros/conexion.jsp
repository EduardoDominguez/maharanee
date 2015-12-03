<?php
	function conectarse()
	{
		$servidor = "localhost";
		$usuario = "root";
		$password = "";
		$bd = "mhrninven";
		$conectar = new mysqli($servidor,$usuario,$password,$bd);
		
		$char = mysqli_set_charset($conectar, "utf8");
		
		return $conectar;
	} 

	$conexion = conectarse();

?>