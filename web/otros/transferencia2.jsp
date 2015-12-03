<?php 
include("sesion.php");
include("conexion.php");

$subtotalVenta;
$totalVenta;
if(isset($_SESSION["carrito"])){
				$datos= $_SESSION["carrito"];
				$persona = $_SESSION["usuario"];
				
				for($i=0; $i<count($datos);$i++){
					
					$id= $datos[$i]['Id'];
					
					$precio= $datos[$i]['Precio'];
					$cantidad= $datos[$i]['Cantidad'];
					$totalprod =$datos[$i]['totalprod'];
					
					$subtotalVenta =$totalprod +$subtotalVenta;
					
					$consulta_usuario = "SELECT * from descuento where IdDesc = '1'";
					$ejecutar_consulta_usuario = $conexion->query($consulta_usuario);
					$registro_usuario = $ejecutar_consulta_usuario->fetch_assoc();
					
					$desc1=$registro_usuario["DesUno"];
					$desc2=$registro_usuario["DesDos"];	
					
					
					
					if($subtotalVenta>=0 AND $subtotalVenta<=14999){
							$porcentaje =($subtotalVenta*$desc1)/100;
							$totalVenta= $subtotalVenta-$porcentaje;
							
							$descuentot= $desc1;
						}else{

								$porcentaje =($subtotalVenta*$desc2)/100;
								$totalVenta= $subtotalVenta-$porcentaje;
								$descuentot= $desc2;
						}
						
						
				
				}
				
				$consulta_id = "SELECT * from persona where UsuPer='$persona'";
				$ejecutar_consulta_id = $conexion->query($consulta_id);
				$registro_id = $ejecutar_consulta_id->fetch_assoc();
				$idusuario=$registro_id["NumEmp"];
				
				$consulta_venta = "INSERT INTO venta (SubVen, DesVen, TotVen, PerVen) 
										VALUES ('$subtotalVenta', '$descuentot','$totalVenta','$idusuario');";
				$ejecutar_consulta_venta = $conexion->query($consulta_venta);
				
				 $consulta_venta2= "SELECT * from venta WHERE PerVen = $idusuario ORDER BY IdVenta DESC LIMIT 1 ;";
 				 $ejecutar_consulta_venta2 = $conexion->query($consulta_venta2);
				 $registro_venta2 = $ejecutar_consulta_venta2->fetch_assoc();
				 $idventa=$registro_venta2["IdVenta"];
				
				
				for($i=0; $i<count($datos);$i++){
					
					$id= $datos[$i]['Id'];
					$persona = $_SESSION["usuario"];
					$precio= $datos[$i]['Precio'];
					$cantidad= $datos[$i]['Cantidad'];
					$totalprod =$datos[$i]['totalprod'];
					
						$consulta_venta = "INSERT INTO compra (producto_IdProd,persona_NumEmp,FecCom,ForPag,PreProd,PreCom,CanCom,venta_IdVenta) 
										VALUES ($id,$idusuario,NOW(),'PayPal',$precio,$totalprod,$cantidad,$idventa)";
						$ejecutar_consulta_venta = $conexion->query($consulta_venta);
						
						$consulta_prod = "SELECT * FROM producto WHERE IdProd =$id";
						$ejecutar_consulta_prod = $conexion->query($consulta_prod);
						$registro_prod = $ejecutar_consulta_prod->fetch_assoc();
				        $idpiezas=$registro_prod["PiePro"]-$cantidad;
				        
				        $consulta_prod = "UPDATE producto set PiePro =$idpiezas where IdProd =$id";
						$ejecutar_consulta_prod = $conexion->query($consulta_prod);
						
				
			}
						
}
	
	

	if(!$ejecutar_consulta_venta || !$ejecutar_consulta_prod)
	{
		$mensaje="Tu compra no ha sido registrada.";
	header("Location: pagofacil.php?mensaje= $mensaje");
	}
	else{
	$mensaje = "Tu compra ha sido guardada."." El total de la compra es $".$totalVenta;
		if($_POST["tran_btn"])
		{
			header("Location: trans_correcta.php?mensaje= $mensaje");
		}
		else if($_POST["payp_btn"])
		{
			$consultaper = "SELECT * FROM persona where NumEmp = '$idusuario'"; 
			$ejecutar_consultaper = $conexion->query($consultaper);
			$per = $ejecutar_consultaper->fetch_assoc();
			
			$to = "ventas@maharanee.net";
			$subject = "Registro de pedido por el usuario ". $persona;
			$txt ="Notificación de pedido: "."Compra hecha por ".$per["NomPer"]." ".$per["ApePat"]." ".$per["ApeMat"].
			" con el usuario ".$persona ." que ha realizado una compra de $". $totalVenta .
			" a través de la opción de pago con PayPal.";
			mail($to,$subject,$txt);
			header("Location: graciaspay.php?mensaje= $mensaje");
			
		}
		else if($_POST["oxxo_btn"])
		{
			header("Location: ");
		}
	}	

?>