<?php

session_start();
error_reporting(E_ALL ^ E_NOTICE );

$conexion2= conectarse();
$consulta= "SELECT *  from producto";
$ejecutar_consulta = $conexion2->query($consulta);

while($registro = $ejecutar_consulta->fetch_assoc())
{
	$nombre= $registro["NomPro"];
	$codigo= utf8_encode($registro["CodPro"]);
 	echo "<option value='$codigo'";

 	if($_GET["producto_slc"]==$registro["CodPro"])
 	{
 		echo "SELECTed";
 	}
 	   echo ">$nombre</option>";
}
//$conexion->close();
?>

