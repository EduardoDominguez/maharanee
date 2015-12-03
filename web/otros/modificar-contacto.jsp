<?php
//Asigno a variables los valores, como el campo de email
// esta desabilitado lo tomamos de el hidden
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
    $usuario = $_POST["usuario_hdn"];
    $contrasena = $_POST["contraseña_txt"];
    $rep_contrasena = $_POST["contraseña2_txt"];
   
    $numemp = $_POST["numemp_hdn"];
    $calleenv = $_POST["calleenvio_txt"];
    $coloniaenv = $_POST["colonianvio_txt"];
    $municipioenv = $_POST["municipionvio_txt"];
    $estadoenv = $_POST["estadonvio_slc"];
    $codigo_postenv = $_POST["codigonvio_post_txt"];
    $referenciaenv = $_POST["referencianvio_txt"];


 	include("conexion.php");
 	$consulta = "SELECT * from persona where UsuPer='$usuario'";
 	$ejecutar_consulta = $conexion->query($consulta);
 	$consulta_usuario = $ejecutar_consulta->fetch_assoc();
 	$num_regs = $ejecutar_consulta->num_rows;



 	if($num_regs==1)
 	{
 		if($contrasena==$rep_contrasena) {
 				
			if($contrasena != $consulta_usuario['ConPas']){
						
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

						$codi = encrypt($contrasena,"$key");
						
						$consulta = "UPDATE persona set NomPer='$nombre', ApePat ='$apepaterno', ApeMat = '$apematerno', DirCal = '$calle', DirCol ='$colonia', DirMun = '$municipio', DirEst= '$estado', 
 						CodPos= '$codigo_post', TelFij= '$tel_fijo', TelCel='$cel', CorEle='$correo', FecNac= '$fecha_nacimiento', SexDat='$sexo', RfcHom='$rfc', UsuPer='$usuario', ConPas= '$codi', 
 						EstPer='A' where UsuPer='$usuario'";
 						$ejecutar_consulta = $conexion->query($consulta);
				
			}
			else {
						$consulta = "UPDATE persona set NomPer='$nombre', ApePat ='$apepaterno', ApeMat = '$apematerno', DirCal = '$calle', DirCol ='$colonia', DirMun = '$municipio', DirEst= '$estado', 
 						CodPos= '$codigo_post', TelFij= '$tel_fijo', TelCel='$cel', CorEle='$correo', FecNac= '$fecha_nacimiento', SexDat='$sexo', RfcHom='$rfc', UsuPer='$usuario', ConPas= '$contrasena', 
 						EstPer='A' where UsuPer='$usuario'";
 						$ejecutar_consulta = $conexion->query($consulta);
			}
 		
        $consulta_env = "UPDATE direccion set DirCal='$calleenv', DirCol ='$coloniaenv', DirMun = '$municipioenv',DirEst = '$estadoenv', CodPos= '$codigo_postenv', RefDat='$referenciaenv' 
        					where persona_NumEmp ='$numemp'";
        $ejecutar_consulta_env = $conexion->query($consulta_env);                                      

 			if($ejecutar_consulta && $ejecutar_consulta_env)
 			{
 				$mensaje = "Se han modificado los datos. <br />
 							<span class='r'>
							<a href= 'views/salir.php'> Salir </a>
							</span>";
 			}
			else
			{
				$mensaje = "No se ha podido realizar los cambios.";
			}
		
		}
		
		else{
             $mensaje = "La contraseña no coincide.";
              header("Location: registro.php?mensaje=$mensaje");
         }  

 	}
 	else
 	{
 		$mensaje= "No se ha podido realizar los cambios.";
 	}
 	$conexion->close();
 	header("Location: ../index.php?op=cambios&mensaje=$mensaje");

?>