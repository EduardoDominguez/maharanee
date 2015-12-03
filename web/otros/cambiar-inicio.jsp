<?php error_reporting(E_ALL ^ E_NOTICE );   ?>
<?php
$textotxt = $_POST["texto_txt"];
$videotxt = $_POST["video_txt"];
$videoreg = $_POST["videoreg_txt"];
include("conexion.php");
    $consulta = "SELECT * from inicio where IdInicio='1'";
    $ejecutar_consulta = $conexion->query($consulta);
    $num_regs = $ejecutar_consulta->num_rows;


    $consulta2 = "SELECT * from inicio where IdInicio='2'";
    $ejecutar_consulta2 = $conexion->query($consulta2);
    $num_regs2 = $ejecutar_consulta2->num_rows;
	
	if ($num_regs = 1) {
    $consulta = "UPDATE inicio set TextIni='$textotxt', VidIni='$videotxt' where IdInicio='1'";
        $ejecutar_consulta = $conexion->query($consulta);
        //video 2

    
    if ($num_regs2 = 1) {
    $consulta2 = "UPDATE inicio set TextIni='$textotxt', VidIni='$videoreg' where IdInicio='2'";
        $ejecutar_consulta2 = $conexion->query($consulta2);

        

        if($ejecutar_consulta && $ejecutar_consulta2)
        {
            $mensaje = "Se han modificado los elementos de inicio.";
        }
		else {
			$mensaje = "No se ha podido realizar los cambios.";
		}
        $conexion->close();
       	header("Location: modificar_index.php?mensaje=$mensaje");
	}
    }   