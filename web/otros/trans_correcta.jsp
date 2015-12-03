<?php 
error_reporting(E_ALL ^ E_NOTICE ); 
session_start();
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
		<title>Compra realizada</title>
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
			
			<h2>Para concluir su compra, deberá realizar su pago con una de las siguientes opciones:</h2>
			<h3>1. <i>Transferencia interbancaria</i><br />
				2. <i>Transferencia bancaria</i><br />
				3. <i>Depósito bancario</i></h3>
			<p>
				<strong>DATOS:</strong><br/>
				<table border="1" style="margin: 0 auto; text-align: center;">
				<tr>
					<td>Banco:</td> 
					<td>Banorte a nombre de JULIO CESAR RIZO HERNANDEZ</td>
				</tr>
				<tr>
					<td>Cuenta:</td> 
					<td>0202294540</td>
				</tr>
				<tr>
					<td>Clabe:</td>
					<td>072225002022945404</td>
				</tr>
				</table>
			</p>
			<p style="text-align: center;"><strong style="color: red;">IMPORTANTE:</strong> 
			<p>Una vez realizado el pago, se deberá enviar el comprobante de su pago digitalmente 
				y anexar sus datos personales: <i>Nombre completo</i>, <i>usuario</i>, <i>dirección</i>, 
				<i>correo electrónico</i> y el <i>número de compra</i> que se encuentra la sección de 
				"<strong><a href="registro-compra-usu.php">Ver Compras</a></strong>", toda esta información 
				enviar al correo <strong>pagos@maharanee.net</strong></p>
			<p><a href="../index.php">Regresar a la pagina principal</a></p>

		</div>
	</body>
		<?php 
		include("../parts/footer.html"); 
		?>
</HTML>