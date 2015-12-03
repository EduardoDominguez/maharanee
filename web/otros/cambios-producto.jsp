<?php 
session_start();
error_reporting(E_ALL ^ E_NOTICE );
?>
<HTML>
	<head>
		<title>Código del producto</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
		<script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
		 	<script>

		 	window.onload = function()
			{
				var listacat = document.getElementById("categoria-lista");
				listacat.onchange = seleccionarcat;
				function seleccionarcat()
				{
					window.location= "?categoria_slc="+listacat.value;
				}

				var lista = document.getElementById("producto-lista");
				lista.onchange = seleccionarprod;
				function seleccionarprod()
				{
					window.location= "?producto_slc="+lista.value+"&categoria_slc="+<?php echo $_GET['categoria_slc'];?>;
				}
			}

			

			</script>
	</head>
<body>
	
	<?php include("../parts/top.php"); ?>
	
	<div class="registro">
	<form name="producto_frm" action="modificar-productos.php" method="post" enctype="multipart/form-data">
	
		<fieldset>
		<legend>Cambios Producto</legend>
		<?php echo $_GET["mensaje"]; ?>
		<div>
			<label for="categoria-lista">Categoria: </label>
			<select id="categoria-lista" class="cambio" name="categoria_slc" >
				<option value="">- - -</option>
				<?php include("selectnum-categoria.php"); ?>
			</select>
		</div>
		<?php
			if($_GET["categoria_slc"]!=null)
			{
			global $categoriacambio;
			$categoriacambio=$_GET["categoria_slc"];
			
			echo "<div>
			<label for='producto-lista'>Productos: </label>
				<select id='producto-lista' class='cambio' name='producto_slc' >
					<option value=''>- - -</option>";
				 include("select-producto-cambio.php"); 
				echo "</select>
			</div>";

			}

		?>


		<?php
		if($_GET["producto_slc"]!=null)
		{
			$producto1=$_GET["producto_slc"];
			$conexion3= conectarse();
			$consulta_producto = "SELECT * from producto where CodPro = '$producto1'";
			$ejecutar_consulta_producto= $conexion3->query($consulta_producto);

			$registro_producto = $ejecutar_consulta_producto->fetch_assoc();
			

			
			$consulta_categoria ="SELECT * from categoria
			join producto on producto.categoria_IdCate = categoria.IdCate
			where producto.CodPro = '$producto1';";
			$ejecutar_consulta_categoria = $conexion3->query($consulta_categoria);
			$registro_categoria = $ejecutar_consulta_categoria->fetch_assoc();

			include("cambios-productos.php");
		}
			
		?>
	</fieldset>
</form>
</div>
	<?php include("../parts/footer.html"); ?>
</body>
</html>