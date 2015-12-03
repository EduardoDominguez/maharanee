<?php 
 

error_reporting(E_ALL ^ E_NOTICE );
	include("sesion.php"); 
	include("conexion.php");

    
	$cantidad=$_POST["cantidad"];
	
	if($cantidad == "")
	{
		$cantidad = 1;
	}
	
	if(isset($_SESSION["carrito"])){
		if(isset($_POST['id'])){
			$arreglo=$_SESSION["carrito"];
			$encontro=false;
			$numero=0;
			for($i=0;$i<count($arreglo);$i++){
				if($arreglo[$i]['Id']==$_POST['id']){
					$encontro= true;
					$numero=$i;
				}
			}
				if($encontro==true){
				$arreglo[$numero]['Cantidad']=$arreglo[$numero]['Cantidad']+$cantidad;
				$_SESSION["carrito"]=$arreglo;
					}else{
						$id = $_POST["id"];
						$nombre="";
						$precio="";
						$imagen="";
						$consulta = "SELECT * FROM producto where IdProd ='$id'"; 
						$ejecutar_consulta = $conexion->query($consulta);

						while ($registro = $ejecutar_consulta->fetch_assoc() ) { 
						$nombre=$registro["NomPro"];
						$precio=$registro["PreVen"];
						$imagen=$registro["ImaGra"];
						
						}
						$arreglo2= array('Id' =>$id,
										  'Nombre'=>$nombre , 
								  		  'Precio'=>$precio,
								   		  'Imagen' => $imagen,
								  		  'Cantidad' => $cantidad,
								  		   'totalprod' => $precio *$cantidad
								  		  );
						array_push($arreglo, $arreglo2);
						$_SESSION["carrito"]=$arreglo;
					}

				}
				
			}else{
				if(isset($_POST['id'])){
				$id = $_POST["id"];
				$nombre="";
				$precio="";
				$imagen="";
				$consulta = "SELECT * FROM producto where IdProd ='$id'"; 
				$ejecutar_consulta = $conexion->query($consulta);

				while ($registro = $ejecutar_consulta->fetch_assoc() ) { 
					$nombre=$registro["NomPro"];
					$precio=$registro["PreVen"];
					$imagen=$registro["ImaGra"];
					
				}
				$arreglo[]= array('Id' =>$id,
								  'Nombre'=>$nombre , 
								  'Precio'=>$precio,
								  'Imagen' => $imagen,
								  'Cantidad' => $cantidad,
								  'totalprod' => $precio *$cantidad
								  );

				$_SESSION["carrito"]=$arreglo;
			}

	}
	
?>
<HTML>
	<head>
		<title>Carrito de Compras</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		<script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
		<script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="../js/scripts.js">
			//Falta hacer los imports de top y footer
		</script>
	</head>
	<body>
		<div class="carrito">
			<center><h1>Carrito de Compras</h1></center>
			<p style="text-align: center;"><strong style="color: red;">IMPORTANTE:</strong> 
				Para cambiar la cantidad del producto, poner el nuevo valor de la cantidad y dar ENTER.</p>
			<?php 
			if(isset($_GET["mensaje"])){
				echo "<center style='color: red;'>";
				echo $_GET['mensaje'];
				echo "<center/>";
			}
			?>
			<div class="tabla">
			<table>
				<tr>
					<th></th>
					<th>Producto</th>
					<th>Precio</th>
					<th>Cantidad</th>
					<th>Total</th>
					<th></th>
				</tr>
			<?php 
			$consulta_usuario = "SELECT * from descuento where IdDesc = '1'";
			$ejecutar_consulta_usuario = $conexion->query($consulta_usuario);
			$registro_usuario = $ejecutar_consulta_usuario->fetch_assoc();
			$desc1=$registro_usuario["DesUno"];
			$desc2=$registro_usuario["DesDos"];		
			
			$total = 0;
			$total2=0;
			if(isset($_SESSION["carrito"])){
				$datos= $_SESSION["carrito"];
				
				for($i=0; $i<count($datos);$i++){
					
			?>
				
					<tr><td colspan="6"><hr></td></tr>
					<tr >
					<td><img width="80px" height="80px;" src="../img/Aretes/<?php echo $datos[$i]['Imagen'];?>"></td>
					<td><?php echo $datos[$i]['Nombre'];?></td>
					<td><?php echo $datos[$i]['Precio'];?></td>
					<td>
						<input type="text" value="<?php echo $datos[$i]['Cantidad'];?>"
							data-precio="<?php echo $datos[$i]['Precio'];?>"
							data-id="<?php echo $datos[$i]['Id'];?>"
							class="cantidad" >
					 </td>
					 <td class="subtotal"><?php echo $datos[$i]['Precio']*$datos[$i]['Cantidad'];
					 	
						
					 	?></td>
					 <td>
					   <a href="../views/eliminarprod.php?id=<?php echo $datos[$i]['Id'];?>">Eliminar</a>
					 </td>
					 </tr>
					
			<?php
				$total= ($datos[$i]['Precio']*$datos[$i]['Cantidad'])+$total;
				$subtot=($datos[$i]['Precio']*$datos[$i]['Cantidad'])+$subtot;
				}

			}
				
				if($subtot>=0 AND $subtot<=14999){
							$porcentaje =($total*$desc1)/100;
							$total= $subtot-$porcentaje;
							
							$descuentot= false;
						}else{

								$porcentaje =($total*$desc2)/100;
								$total= $subtot-$porcentaje;
								$descuentot= true;
						}
			
				
			?>
			
				<tr><td colspan="6"><hr></td></tr>
				<tr class="b">
					<td></td>
					<td></td>
					<td></td>
					<td >Subtotal:</td>
					<td id="subt"><?php echo $subtot;?></td>
					<td></td>
				</tr>
				<tr class="b">
					<td></td>
					<td></td>
					<td></td>
					<td>Descuento:</td>
					<?php 
						if($descuentot){
							echo "<td id='descuent'>$desc2"."%"."</td>";
							}else{	
								echo "<td id='descuent'>$desc1"."%"."</td>";}
					?>
					<td></td>
				</tr>
				<tr class="b">
					<td></td>
					<td></td>
					<td></td>
					<td>Envio:</td>
					<td>Gratis!</td>
					<td></td>
				</tr>
				<tr class="b">
					<td></td>
					<td></td>
					<td></td>
					<td >Total:</td>
					<td id="total"><?php echo $total;  ?></td>
					<td></td>
				</tr>
			</table>
			<?php
			if (!isset($_POST["id"])) { 
				echo "<a href='productos.php?categoria=1'><input class='regresar' type='submit' value='Seguir comprando'></a>";
				}else{
			?>
			<a href="productos.php?categoria=<?php echo $_POST['id'] ?>"><input class="regresar" type="submit" value="Seguir Comprando"></a>
			<?php

				}
			?>
			

			<?php
			if($total!=0){
			echo "<a href='pagar.php'><input class='compra' type='submit' value='Pago fácil'></a>";
			}
			
			 ?>
		</div>
	</body>
</HTML>