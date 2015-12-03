<?php
    
    $nombre = $_POST["nombre_txt"];
    $apematerno = $_POST["apema_txt"];
    $apepaterno = $_POST["apepa_txt"];
    $calle = $_POST["calle_txt"];
    $colonia = $_POST["colonia_txt"];
    $municipio = $_POST["municipio_txt"];
    $estado = $_POST["estado_slc"];
    $codigo_post = $_POST["codigo_post_txt"];
    $correo = $_POST["correo_txt"];
    $tel_fijo = $_POST["tel_fijo_txt"];
    $cel = $_POST["cel_txt"];
    $fecha_nacimiento = $_POST["nacimiento_txt"];
    $sexo = $_POST["sexo_rdo"];
    $rfc = $_POST["rfc_txt"];
    $usuario = $_POST["usuario_txt"];
    $contrasena = $_POST["contraseña_txt"];
    $rep_contrasena = $_POST["contraseña2_txt"];
 
    if($_POST["calleenvio_txt"]==""){
      $calleenv =$calle;
      $coloniaenv = $colonia;
      $municipioenv = $municipio;
      $estadoenv =   $estado;
      $codigo_postenv = $codigo_post;
      $referenciaenv = $_POST["referencianvio_txt"];

    }else{
      $calleenv = $_POST["calleenvio_txt"];
      $coloniaenv = $_POST["colonianvio_txt"];
      $municipioenv = $_POST["municipionvio_txt"];
      $estadoenv = $_POST["estadonvio_slc"];
      $codigo_postenv = $_POST["codigonvio_post_txt"];
      $referenciaenv = $_POST["referencianvio_txt"];
    }
    

  
    include("conexion.php");    
    $consulta= "select * from persona where UsuPer = '$usuario'";
    $ejecutar_consulta = $conexion->query($consulta);
    $num_regs = $ejecutar_consulta->num_rows;

   
    if($num_regs == 0)
    {

        if($contrasena==$rep_contrasena) {
        			
        $key=$usuario;

		//Codificación base64
			function encrypt($string, $key) {
   				$result = '';
   				for($i=0; $i<strlen($string); $i++) {
      				$char = substr($string, $i, 1);
      				$keychar = substr($key, ($i % strlen($key))-1, 1);
      				$char = chr(ord($char)+ord($keychar));
      				$result.=$char;
   				}
   				return base64_encode($result);
			}

			$cod = encrypt($contrasena,"$key");
				
        
			
		
          $consulta = "insert into persona(NomPer,ApePat,ApeMat,DirCal,DirCol,DirMun,DirEst,CodPos,TelFij,TelCel,CorEle,FecNac,RfcHom,SexDat,FecIni,UsuPer,ConPas,EstPer,TipPer) 
          				values ('$nombre','$apepaterno','$apematerno','$calle','$colonia','$municipio','$estado','$codigo_post','$tel_fijo','$cel','$correo','$fecha_nacimiento',
          				'$rfc','$sexo',now(),'$usuario', '$cod', 'A', 'U' )";
           $ejecutar_consulta = $conexion->query($consulta);

            
          $consulta_numemp = "SELECT * from persona where UsuPer = '$usuario'";
          $ejecutar_consulta_usuario = $conexion->query($consulta_numemp);
          $registro_usuario = $ejecutar_consulta_usuario->fetch_assoc();
          $numemp = $registro_usuario["NumEmp"];



          $consulta2 = "insert into direccion(DirCal,DirCol,DirMun,DirEst,DirPai,CodPos,RefDat,persona_NumEmp) 
          				values ('$calleenv','$coloniaenv','$municipioenv','$estadoenv','Mexico','$codigo_postenv','$referenciaenv','$numemp')";
          $ejecutar_consulta2 = $conexion->query($consulta2);
        
           if($ejecutar_consulta && $ejecutar_consulta2){
                 
                $mensaje ="Datos registrados.";
                 header("Location: ../index.php?mensaje=$mensaje");
            }
                else
                 $mensaje = "No se pudo dar de alto al contacto";
         }
         else{
             $mensaje = "La contraseña no coincide.";
              header("Location: registro.php?mensaje=$mensaje");
         }  
        
    }
    else
    {
         $mensaje = "El usuario ya existe."; 
        header("Location: registro.php?mensaje=$mensaje");
    }

    $conexion->close();
   
?>
