<?php 
error_reporting(E_ALL ^ E_NOTICE ); 
session_start();
include("conexion.php");
if(isset($_SESSION['autentificado']))
{
}
else {
	header("Location: ../index.php");
    exit;
}
?>
<HTML>
	<head>
		<title>Pago fácil</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
		<script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
	
		
	</head>
	
	<body>
		<?php 
		include("../parts/top.php"); 
		?>
	
		<div class="pagofacil">
			<form name="alta_persona" action="transferencia.php" method="post" enctype="multipart/form-data">	
			
				<center><h2>Pago fácil</h2></center>
				<p style="text-align: center;"> Seleccione el método de pago:</p>
				<input class="transban" type="submit" id="enviar" name="tran_btn" value="Transferencia bancaria o &#x00A; depósito bancario" >
						
		<?php
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
				}
				?>
			</form>
			
			<form name="trasnpaypal" action="transferencia2.php" method="post" enctype="multipart/form-data">
				<input class="transban" type="submit" id="enviar" name="payp_btn" value="PayPal">
				<?php
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
				}
				?>
			</form>

		</div>
	</body>
		<?php 
		include("../parts/footer.html"); 
		?>
</HTML>
