<?php
session_start();
include("../views/conexion.php");

$consulta_usuario = "SELECT * from descuento where IdDesc = '1'";
$ejecutar_consulta_usuario = $conexion->query($consulta_usuario);
$registro_usuario = $ejecutar_consulta_usuario->fetch_assoc();
$desc1=$registro_usuario["DesUno"];
$desc2=$registro_usuario["DesDos"];		
		
$arreglo=$_SESSION['carrito'];
$total=0;
$numero=0;

for($i=0;$i<count($arreglo);$i++){
	if($arreglo[$i]['Id']==$_POST['Id']){
		$numero=$i;$total= ($total*$desc1)/100;
	$descuentot= false;
	}
}

$arreglo[$numero]['Cantidad']=$_POST['Cantidad'];
$arreglo[$numero]['totalprod']=$_POST['PrecioProd'];

for($i=0;$i<count($arreglo);$i++){
	$total=($arreglo[$i]['Precio']*$arreglo[$i]['Cantidad'])+$total;
}

if($total>=0 AND $total<=14999){
	$porcentaje =($total*$desc1)/100;
	$total= $total-$porcentaje;
	$descuentot= false;
}else{
	$porcentaje =($total*$desc2)/100;
	$total= $total-$porcentaje;
	$descuentot= true;
}

$_SESSION['carrito']=$arreglo;
echo $total;
echo $descuentot;
?>
