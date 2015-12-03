<?php 
include("sesion.php");  
error_reporting(E_ALL ^ E_NOTICE );
?>

<HTML>
	<head>
		<title>Producto</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
		<script src="../js/imgSwitch.js"></script>
	</head>
	<body>
		<?php 
		include("conexion.php"); 
			$id = $_GET["id"];
		
			$consulta_usuario = "SELECT * from producto where IdProd = '$id'";
			$ejecutar_consulta_usuario = $conexion->query($consulta_usuario);
			$registro = $ejecutar_consulta_usuario->fetch_assoc();
		?>
		<div class="prod_clic">
			<div class="prod_img">
					<img id="mainImg" width="335px" height="251px" src="<?php echo "../img/Aretes/".$registro["ImaGra"]; ?>">
					<img id="miniIm1" width="80px" height="60px" src="<?php echo "../img/Aretes/".$registro["ImaUno"]; ?>">
					<img id="miniIm2" width="80px" height="60px" src="<?php echo "../img/Aretes/".$registro["ImaDos"]; ?>">
					<img id="miniIm3" width="80px" height="60px" src="<?php echo "../img/Aretes/".$registro["ImaCaj"]; ?>">
				<a href="<?php echo $registro['VidPro'];?>" target="_blank">
					<img width="70px" height="70px" src="<?php echo "../img/play.jpg"; ?>">
				</a>
			</div>
			<div class="prod_info">
				<p class="nombre"><?php echo $registro["NomPro"]; ?></p>
				<p class="caracteristicas">
					<strong>Características: </strong><?php echo $registro["CarPro"]; ?>
				</p>
				<p class="medidas">
					<strong>Medidas: </strong><?php echo $registro["MedPro"]; ?>
				</p>
				<p class="precio">
					<strong>Precio: </strong><?php echo "$".$registro["PreVen"]; ?>
					</p>
				
 				<form name = "valida_datos_get" action="carrito.php" method="post" enctype = "application/x-www.form-urlencoded"  >
 				<input type= "hidden" name="id" value="<?php echo $id ?>" />
				<p class="cantidad"> <strong>Cantidad: </strong><input type="text" name="cantidad"></p>
 				<input class="agregar" type= "submit"  value= "Agregar al carrito" />


			</form>
				<a href="productos.php?categoria=<?php echo $_GET['categoria'] ?>">
					<button class="regresar" type="button" value="Regresar">Regresar</button>
				</a>
			</div>
		</div>
	</body>
</HTML>