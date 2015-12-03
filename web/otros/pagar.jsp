<?php
	include("sesion.php");  
	error_reporting(E_ALL ^ E_NOTICE ^  E_WARNING );
	include("conexion.php");

	if(isset($_SESSION["carrito"])){
		$datos= $_SESSION["carrito"];
		$contador=0;
		$subtot=0;
		$total=0;
		for($i=0; $i<count($datos);$i++){	

			$cantidad =$datos[$i]['Cantidad'];
			$id= $datos[$i]['Id'];
			
			$subtot=$datos[$i]['totalprod']+$subtot;
			
			
			$consulta = "SELECT * FROM producto where IdProd ='$id'"; 
			$ejecutar_consulta = $conexion->query($consulta);
			$registro_producto = $ejecutar_consulta->fetch_assoc();

			if($cantidad>$registro_producto['PiePro'])
			{
				$mensaje .= "<p style='color:red;text-align:center;'> No contamos con la cantidad que solicita del producto 					   <strong>".$registro_producto['NomPro']."</strong>.</p>";
				$contador++;

			}
			
		}
	}
	$mensaje2 = "La compra debe igual o mayor de 3000";
			$consulta_usuario4 = "SELECT * from descuento where IdDesc = '1'";
			$ejecutar_consulta_usuario4 = $conexion->query($consulta_usuario4);
			$registro_usuario4 = $ejecutar_consulta_usuario4->fetch_assoc();
			$desc1=$registro_usuario4["DesUno"];
			$desc2=$registro_usuario4["DesDos"];	
			
	if($subtot>=0 AND $subtot<=14999){
		$porcentaje =($subtot*$desc1)/100;
		$total= $subtot-$porcentaje;
		
	}else{
	$porcentaje =($subtot*$desc2)/100;
	$total= $subtot-$porcentaje;
	
	}
		

	if($contador!=0)
	{
		header("Location: carrito.php?mensaje=$mensaje");
	}
	else if($total<3000)
	{
	
		header("Location: carrito.php?mensaje=$mensaje2");
	}
	else
	{
		header("Location: pagofacil.php");
	}

?>