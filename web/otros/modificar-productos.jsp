<?php
 	$id2 = $_POST["id_hdn"];
 	$nombreprod2 = $_POST["nombre_txt"];
	$codigo2 = $_POST["codigo_txt"];
	$medidas2 = $_POST["medidas_txt"];
    $caracteristicas2 = $_POST["caract_txt"];
    $piezas2 = $_POST["piezas_txt"];
    $oferta2 = $_POST["oferta_txt"];
    $categoria2 = $_POST["categoria_slc"];
    $precio2 = $_POST["precio_txt"];
	$estado2 = $_POST["estado_txt"];
	$codant = $_POST["codigoanterior_txt"];
	$video2 = $_POST["video_txt"];
	
   
	include("funciones.php");
	include("conexion.php"); 

	$consulta = "SELECT * from producto where CodPro='$codigo2' AND IdProd='$id2'";
	
	$ejecutar_consulta = $conexion->query($consulta);
	$datos = $ejecutar_consulta->fetch_assoc();
	
	 if($oferta2 !=$datos [OfePro])
   	 {
   	 
       		$precio2 =  $precio2 - (($precio2*$oferta2)/100);
    	 }else if($precio2 != $datos [PreVen]){
    	 	$precio2 =  $precio2 - (($precio2*$oferta2)/100);
    	 }
    	 
	
	
 	$num_regs = $ejecutar_consulta->num_rows;
	//echo "$num_regs"."<br/>";
	
	if($num_regs==1)
 	{

		if(empty($_FILES["fotog_fls"]["tmp_name"]))
	 		{
	 			
	 			$nombre = $_POST["fotog_hdn"];
	 		}
	 		else
	 		{
	 			$tipo = $_FILES["fotog_fls"]["type"]; //jpg, png, gif
			   	$archivo = $_FILES["fotog_fls"]["tmp_name"]; //como tal el archivo
			   	$nombre = $_FILES["fotog_fls"]["name"];
			   	$imagen = subir_imagen($tipo,$archivo,$nombre); 
	 		}

	 	if(empty($_FILES["foto1_fls"]["tmp_name"]))
	 		{
	 			  	$nombre2 = $_POST["foto1_hdn"];
	 		}
	 		else
	 		{
	 			$tipo2 = $_FILES["foto1_fls"]["type"]; //jpg, png, gif
			   	$archivo2 = $_FILES["foto1_fls"]["tmp_name"]; //como tal el archivo
			   	$nombre2 = $_FILES["foto1_fls"]["name"];
			   	$imagen2 = subir_imagen($tipo2,$archivo2,$nombre2); 
	 		}


	 	if(empty($_FILES["foto2_fls"]["tmp_name"]))
	 		{
	 			$nombre3 = $_POST["foto2_hdn"];
	 		}
	 		else
	 		{
	 			$tipo3 = $_FILES["foto2_fls"]["type"]; //jpg, png, gif
			   	$archivo3 = $_FILES["foto2_fls"]["tmp_name"]; //como tal el archivo
			   	$nombre3 = $_FILES["foto2_fls"]["name"];
			   	$imagen3 = subir_imagen($tipo3,$archivo3,$nombre3); 
	 		}

	 	if(empty($_FILES["fotoc_fls"]["tmp_name"]))
	 		{
	 			$nombrec = $_POST["fotoc_hdn"];
	 		}
	 		else
	 		{
	 			$tipoc = $_FILES["fotoc_fls"]["type"]; //jpg, png, gif
			   	$archivoc = $_FILES["fotoc_fls"]["tmp_name"]; //como tal el archivo
			   	$nombrec = $_FILES["fotoc_fls"]["name"];
			   	$imagenc = subir_imagen($tipoc,$archivoc,$nombrec); 
	 		}


 		$consulta = "UPDATE producto set ImaGra='$nombre', ImaUno='$nombre2', ImaDos='$nombre3', ImaCaj='$nombrec', VidPro='$video2', NomPro ='$nombreprod2', CodPro = '$codigo2', 
 		CarPro= '$caracteristicas2', MedPro= '$medidas2', PiePro= '$piezas2', PreVen='$precio2', OfePro='$oferta2', EstPro= '$estado2', categoria_IdCate='$categoria2' 
 		where CodPro='$codigo2'";
 		
 			
 		$ejecutar_consulta = $conexion->query($consulta);
		
		
 		if($ejecutar_consulta)
 		{
 			$mensaje = "Se han realizado los cambios en los datos del producto.";
 		}
		else
		 {
			$mensaje = "No se ha podido modificar.";
		}

 	}
	
	elseif ($num_regs==0) 
	{
		$consulta_query = "SELECT * from producto where CodPro='$codigo2'";
		$ejecutar_consulta_query = $conexion->query($consulta_query);
		$resultado_consulta = $ejecutar_consulta_query->fetch_assoc();
		
		$rc = $resultado_consulta['IdProd'];
		echo "$rc";
		if( $rc != '')
		{
			$mensaje= "Ya existe este código en otro producto.";
		}
		
		else {
	
			if(empty($_FILES["fotog_fls"]["tmp_name"]))
		 		{
		 			
		 			$nombre = $_POST["fotog_hdn"];
		 		}
		 		else
		 		{
		 			$tipo = $_FILES["fotog_fls"]["type"]; //jpg, png, gif
				   	$archivo = $_FILES["fotog_fls"]["tmp_name"]; //como tal el archivo
				   	$nombre = $_FILES["fotog_fls"]["name"];
				   	$imagen = subir_imagen($tipo,$archivo,$nombre); 
		 		}
	
		 	if(empty($_FILES["foto1_fls"]["tmp_name"]))
		 		{
		 			  	$nombre2 = $_POST["foto1_hdn"];
		 		}
		 		else
		 		{
		 			$tipo2 = $_FILES["foto1_fls"]["type"]; //jpg, png, gif
				   	$archivo2 = $_FILES["foto1_fls"]["tmp_name"]; //como tal el archivo
				   	$nombre2 = $_FILES["foto1_fls"]["name"];
				   	$imagen2 = subir_imagen($tipo2,$archivo2,$nombre2); 
		 		}
	
	
		 	if(empty($_FILES["foto2_fls"]["tmp_name"]))
		 		{
		 			$nombre3 = $_POST["foto2_hdn"];
		 		}
		 		else
		 		{
		 			$tipo3 = $_FILES["foto2_fls"]["type"]; //jpg, png, gif
				   	$archivo3 = $_FILES["foto2_fls"]["tmp_name"]; //como tal el archivo
				   	$nombre3 = $_FILES["foto2_fls"]["name"];
				   	$imagen3 = subir_imagen($tipo3,$archivo3,$nombre3); 
		 		}
	
		 	if(empty($_FILES["fotoc_fls"]["tmp_name"]))
		 		{
		 			$nombrec = $_POST["fotoc_hdn"];
		 		}
		 		else
		 		{
		 			$tipoc = $_FILES["fotoc_fls"]["type"]; //jpg, png, gif
				   	$archivoc = $_FILES["fotoc_fls"]["tmp_name"]; //como tal el archivo
				   	$nombrec = $_FILES["fotoc_fls"]["name"];
				   	$imagenc = subir_imagen($tipoc,$archivoc,$nombrec); 
		 		}
		 		
			$consulta = "UPDATE producto set ImaGra='$nombre', ImaUno='$nombre2', ImaDos='$nombre3', ImaCaj='$nombrec', VidPro='$video2', NomPro ='$nombreprod2', CodPro = '$codigo2', 
	 		CarPro= '$caracteristicas2', MedPro= '$medidas2', PiePro= '$piezas2', PreVen='$precio2', OfePro='$oferta2', EstPro= '$estado2', categoria_IdCate='$categoria2' 
	 		where CodPro='$codant' AND IdProd='$id2'";
	 		
	 			
	 		$ejecutar_consulta = $conexion->query($consulta);
			
			
	 		if($ejecutar_consulta)
	 		{
	 			$mensaje = "Se han cambiado los datos del producto con nuevo código.";
	 		}
			else
			 {
				$mensaje = "No se ha podido modificar los datos con nuevo código.";
			}
		}
	}
	
	else 
 	{
 		$mensaje= "No se pudo modificar.";
 	}
 	$conexion->close();
	//echo "$mensaje";
 	header("Location: ../index.php?mensaje=$mensaje");
 	
?>