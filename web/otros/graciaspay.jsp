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
		<title>Pago fácil - PayPal</title>
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
		<?php
			if($_GET[mensaje])
			{
			 echo "<Strong style='color:red'>";
			 echo $_GET[mensaje];
			 echo "</Strong>";
			}
		?>
			<h2>Para concluir su compra, deberá realizar su pago dando clic en el botón de <span style="color: red">
			"COMPRAR AHORA"</span> que se encuentra abajo de las instrucciones.</h2>
			<p style="text-align: center;"><strong style="color: red;">IMPORTANTE:</strong> 
			<p>Una vez realizado el pago, se deberá enviar el comprobante de su pago digitalmente 
				(<strong>correo con la confirmación de compra</strong>) y anexar sus datos personales: <i style="color: red">
					Nombre completo</i>, <i style="color: red">usuario</i>, <i style="color: red">dirección</i>, 
					<i style="color: red">correo electrónico</i> y el <i style="color: red">número de compra</i> que se 
				encuentra la sección de "<strong><a href="registro-compra-usu.php">Ver Compras</a></strong>", 
				toda esta información enviar al correo <strong>pagos@maharanee.net</strong></p>


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

		<form name="_xclick" action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
    		<input type="hidden" name="cmd" value="_xclick">
    		<input type="hidden" name="business" value="ramsesulises@maharanee.net">
    		<input type="hidden" name="lc" value="MX">
    		<input type="hidden" name="currency_code" value="MXN">
    		<input type="hidden" name="item_name" value="Orden de compra - Productos Maharanee">
    		<input type="hidden" name="amount" value="<?php echo $totalVenta ?>">
    		<input type="hidden" name="return" value="http://maharanee.net/views/exito.php">
    		<input type="hidden" name="notify_url" value="localhost/model/ipn.php">
    		<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
    		<input type="image" src="https://www.paypalobjects.com/es_XC/MX/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal, la forma más segura y rápida de pagar en línea.">
		<img alt="" border="0" src="https://www.paypalobjects.com/es_XC/i/scr/pixel.gif" width="1" height="1">
		</form>

		</div>
	</body>
		<?php 
		include("../parts/footer.html"); 
		?>
</HTML>