<?php

    $nombreprod = $_POST["nombre_txt"];
    $codigo = $_POST["codigo_txt"];
    $medidas = $_POST["medidas_txt"];
    $caracteristicas = $_POST["caract_txt"];
    $piezas = $_POST["piezas_txt"];
    $oferta = $_POST["oferta_txt"];
    $categoria = $_POST["categoria_slc"];
    $precio = $_POST["precio_txt"];
    $video = $_POST["video_txt"];
	
     if($oferta>0)
    {
       $precio =  $precio - (($precio*$oferta)/100);
    }

    include("funciones.php");
    $tipo = $_FILES["fotog_fls"]["type"]; //jpg, png, gif
   	$archivo = $_FILES["fotog_fls"]["tmp_name"]; //como tal el archivo
   	$nombre = $_FILES["fotog_fls"]["name"];
   	$imagen = subir_imagen($tipo,$archivo,$nombre); 

   	$tipo2 = $_FILES["foto1_fls"]["type"]; //jpg, png, gif
   	$archivo2 = $_FILES["foto1_fls"]["tmp_name"]; //como tal el archivo
   	$nombre2 = $_FILES["foto1_fls"]["name"];
   	$imagen2 = subir_imagen($tipo2,$archivo2,$nombre2); 
     
    $tipo3 = $_FILES["foto2_fls"]["type"]; //jpg, png, gif
   	$archivo3 = $_FILES["foto2_fls"]["tmp_name"]; //como tal el archivo
   	$nombre3 = $_FILES["foto2_fls"]["name"];
   	$imagen3 = subir_imagen($tipo3,$archivo3,$nombre3); 

   	$tipoc = $_FILES["fotoc_fls"]["type"]; //jpg, png, gif
   	$archivoc = $_FILES["fotoc_fls"]["tmp_name"]; //como tal el archivo
   	$nombrec = $_FILES["fotoc_fls"]["name"];
   	$imagenc = subir_imagen($tipoc,$archivoc,$nombrec); 
   	
    include("conexion.php");       
    $consultaproalt= "select * from producto where CodPro = '$codigo' AND categoria_IdCate = '$categoria' ";
    $ejecutar_consulta_proalt = $conexion->query($consultaproalt);
    $num_regs = $ejecutar_consulta_proalt->num_rows;
	
	if($num_regs == 0)
    {
        
          $consulta = "insert into producto(ImaGra,ImaUno,ImaDos,ImaCaj,VidPro,NomPro,CodPro,CarPro,MedPro,PiePro,PreVen,OfePro,EstPro,categoria_IdCate) 
          				values ('$nombre','$nombre2','$nombre3','$nombrec','$video','$nombreprod','$codigo', '$caracteristicas', '$medidas', '$piezas', '$precio','$oferta','A','$categoria')";
          $ejecutar_consulta = $conexion->query($consulta);

          
           if($ejecutar_consulta)
           {
                $mensaje = "Se ha dado de alta el producto.";
                 header("Location: ../index.php?mensaje=$mensaje");
            }
            else
            {
                 $mensaje = "No se pudo dar de alta el producto.";
                  header("Location: ../index.php?mensaje=$mensaje");
            }
	}
    else
    {
         $mensaje = "El producto ya existe."; 
        header("Location: ../index.php?mensaje=$mensaje");
    }
	
      
    $conexion->close();
   
?>
