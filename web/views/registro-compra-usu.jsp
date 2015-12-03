<?php
	include("conexion.php");
	include("sesion.php");

?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8"/>
	<title>Panel de Administración</title>
	
	<link rel="stylesheet" type="text/css" href="../css/default.css">
	<link rel="stylesheet" type="text/css" href="../css/style.css">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	
</head>
<body>

	<?php 
		
			include("../parts/top.php"); 
			if (isset($_GET["page"])) { 
				$page  = $_GET["page"]; 
			} else 
			{ 
				$page=1; 
			 }
		$cont = ($page-1) * 5; 
?>
	<div class="registro">
	<center><h1>Compras</h1></center>
	<table border="1px" width="100%">	
		<tr>
			<th>Nombre Producto</th>
			<th>Fecha de Compra</th>
			<th>Forma de pago</th>
			<th>Precio del Producto</th>
			<th>Cantidad</th>
			<th>Total</th>
		</tr>	

		<?php
				$usu= $_SESSION['usuario'];
				$consulta2 = "SELECT * FROM persona where UsuPer = '$usu' "; 
			 	$ejecutar_consulta2 = $conexion->query($consulta2);
			 	$per = $ejecutar_consulta2->fetch_assoc();

				$id=$per['NumEmp'];
			$numeroventa=0;
			   	$consulta = "SELECT * FROM compra where persona_NumEmp='$id' order by FecCom desc "; 
				$ejecutar_consulta = $conexion->query($consulta);
			 	
 				while ($compra = $ejecutar_consulta->fetch_assoc() ) {
			 	
			 	 $idprod=$compra['producto_IdProd'];
				 $consulta3 = "SELECT * FROM producto where IdProd= '$idprod'"; 
				 $ejecutar_consulta3 = $conexion->query($consulta3);
				 $produ = $ejecutar_consulta3->fetch_assoc();

				 $idventa=$compra['venta_IdVenta'];
				 $consulta4 = "SELECT * FROM venta where IdVenta='$idventa'"; 
				 $ejecutar_consulta4 = $conexion->query($consulta4);
				 $venta = $ejecutar_consulta4->fetch_assoc();
			 
			 if($numeroventa!=$compra['venta_IdVenta']){
			 ?>
				<tr id="compra">
					<td>Compra Número: <?php echo $compra['venta_IdVenta']; ?> </td>
					<td>Subtotal: <?php echo $venta['SubVen']; ?> </td>
					<td>Descuento: <?php echo $venta['DesVen'].' %'; ?> </td>
					<td>Total: <?php echo $venta['TotVen']; ?> </td>
					<td></td>
					<td></td>
				</tr>
			<?php
					}
					$numeroventa=$compra['venta_IdVenta'];
			 ?>

			<tr>
				
				<td><?php echo $produ["NomPro"];?></td>
				<td><?php echo $compra["FecCom"];?></td>
				<td><?php echo $compra["ForPag"];?></td>
				<td><?php echo $compra["PreProd"];?></td>
				<td><?php echo $compra["CanCom"];?></td>
				<td><?php echo $compra["PreCom"];?></td>
			</tr>	
			<?php
			 }
			?>
	</table>



	</div>
	<?php include("../parts/footer.html");?>
	
</body>
</html>