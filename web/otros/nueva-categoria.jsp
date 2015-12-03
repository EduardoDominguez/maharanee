<?php

 error_reporting(E_ALL ^ E_NOTICE );  
 	
    $categoria= $_POST["nombre_cat_txt"];

 	include("conexion.php");
 	$consulta= "SELECT * from categoria where NomCat = '$categoria'";
 	$ejecutar_consulta = $conexion->query($consulta);
 	$num_regs = $ejecutar_consulta->num_rows;
   
    if($num_regs ==0)
    {
    	
        
    	$consulta = "INSERT into categoria(NomCat,EstCat ) values ('$categoria','A')";

    	$ejecutar_consulta = $conexion->query(utf8_encode($consulta));

    	if($ejecutar_consulta)
    	  $mensaje = "Se ha dado de alta la categoría.";
    	else
    	  $mensaje= "No pudo dar de alta la categoría.";
    }
    else{
        $mensaje= "La categoria ya existe.";
    }
    header("Location: agregar-eliminar-categorias.php?mensaje=$mensaje");


?>