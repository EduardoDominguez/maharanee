<?php 
	include("sesion.php");
	if(isset($_SESSION["carrito"])){
	unset($_SESSION["carrito"]);
	}
	header("Location: procesando.php");
?>
