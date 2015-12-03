<?php
  include("conexion.php");
  $nombre = $_POST["usuario_txt"];
  $password = $_POST["pwd"];
  
  if($cons = $conexion->query("select UsuPer from persona where UsuPer = '{$nombre}' LIMIT 1;")){
  	if($count = $cons->num_rows){
  		$row = $cons->fetch_object();
		$key = $row->UsuPer;
  	}
  }else{
  	die ($conexion->error);
  }
  
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

			$cod = encrypt($password,"$key");
			
  $consulta = "SELECT * from persona where UsuPer = '$nombre' && ConPas = '$cod' && EstPer = 'A'";
  $ejecutar_consulta = $conexion->query($consulta);
  $registro_usuario = $ejecutar_consulta->fetch_assoc();
  $num_regs = $ejecutar_consulta->num_rows;



  if($num_regs !=0){
    //inicio de sesion
     session_start();
	   
	//variables de sesion
	$_SESSION["autentificado"] = true;
	$_SESSION["usuario"] = $_POST["usuario_txt"];
	$_SESSION["nombre"]=$registro_usuario["NomPer"]." ".$registro_usuario["ApePat"]." ".$registro_usuario["ApeMat"];
	if($registro_usuario["TipPer"]=="A"){
  	$_SESSION["admin"] = true;
  }
	header("Location: ../index.php");
	
  }else{
   header("Location: ../index.php?error=si");
  }
     $conexion->close();
?>