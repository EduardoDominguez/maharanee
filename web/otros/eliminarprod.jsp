<?php
include("sesion.php");  
error_reporting(E_ALL ^ E_NOTICE );

	if(isset($_SESSION["carrito"])){
		if(isset($_GET['id'])){
			$arreglo=$_SESSION["carrito"];
			
			for($i=0;$i<count($arreglo);$i++){
			
				if($arreglo[$i]['Id']==$_GET['id']){
						unset($arreglo[$i]);
						$arreglo2 = array_merge($arreglo);
						$_SESSION["carrito"]=$arreglo2;

					
				}
				
			}
		}
                   header("Location:  carrito.php");
	}
?>