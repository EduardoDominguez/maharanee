<?php
error_reporting(E_ALL ^ E_NOTICE );
 include("conexion.php");
$consulta= "SELECT * from categoria WHERE EstCat = 'A' ORDER BY IdCate";
$ejecutar_consulta = $conexion->query($consulta);

while($registro = $ejecutar_consulta->fetch_assoc())
{
	$nombre_categoria= utf8_encode($registro["NomCat"]);
	$num_categoria =$registro["IdCate"];
 	echo "<option value='$num_categoria'";

 	if($_GET["categoria_slc"]==$registro["NomCat"])
 	{
 		echo "SELECTed";
 	}
 	   echo ">$nombre_categoria</option>";
}
//$conexion->close();
?>