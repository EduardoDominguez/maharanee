<?php 
include("sesion.php");

 ?>
<HTML>
	<head>
		<title>Consultar usuarios</title>
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
	<div class="registro">
	<!-- <form name="cambio_frm" action="modificar-contacto.php" method="post" enctype="multipart/form-data"> -->

		<?php
		if($_SESSION["admin"])
		{
			@$id=$_GET['id'];
			@$palabra=$_GET['clave'];
			
			include("conexion.php");

			$consulta_usuario = "SELECT * from persona where NumEmp = '$id'";
			$ejecutar_consulta_usuario = $conexion->query($consulta_usuario);
			$registro_usuario = $ejecutar_consulta_usuario->fetch_assoc();
			$num_regs = $ejecutar_consulta_usuario->num_rows;
			
			if ($num_regs==0) {
				$consulta_usuario = "SELECT * from persona where UsuPer like '%$palabra%'";
				$ejecutar_consulta_usuario = $conexion->query($consulta_usuario);
				$registro_usuario = $ejecutar_consulta_usuario->fetch_assoc();
			}
	
			$numemp = $registro_usuario["NumEmp"];

			$consulta_envio= "SELECT * from direccion where persona_NumEmp = '$numemp'";
			$ejecutar_consulta_envio = $conexion->query($consulta_envio);
			$registro_envio = $ejecutar_consulta_envio->fetch_assoc();


		}
			  
		?>
	
		
		<table>
			<h2>Datos personales</h2>
			<tr>
				<td>
					<p>Nombre:</p>
					<input placeholder="Nombre" type="text" name="nombre_txt" value="<?php echo $registro_usuario['NomPer']; ?>"  disabled required>
				</td>
				<td>
					<p>Apellido Paterno:</p>
					<input placeholder="Apellido Paterno" type="text" name="apepa_txt" value="<?php echo $registro_usuario['ApePat']; ?>" disabled required>
				</td>
				<td>
					<p>Apellido Materno:</p>
					<input placeholder="Apellido Materno" type="text" name="apema_txt" value="<?php echo $registro_usuario['ApeMat']; ?>" disabled required>
				
				</td>
				
				
				
			</tr>
			<tr>
				<td>
					<p>Calle y Numero:</p>
					<input placeholder="Calle y Numero" type="text" name="calle_txt" value="<?php echo $registro_usuario['DirCal']; ?>" disabled required>
				</td>
				<td>
					<p>Colonia :</p>
					<input placeholder="Colonia" type="text" name="colonia_txt" value="<?php echo $registro_usuario['DirCol']; ?>" disabled required>
				</td>
				<td>
					<p>Codigo Postal:</p>
					<input placeholder="Codigo Postal" type="text" name="codigo_post_txt" value="<?php echo $registro_usuario['CodPos']; ?>" disabled required >
				</td>
				
			</tr>
			<tr>
			<td>
					<p>Municipio:</p>
					<input placeholder="Municipio" type="text" name="municipio_txt" value="<?php echo $registro_usuario['DirMun']; ?>" disabled required >
				</td>
				<td>
					<p>Estado:</p>
					<select name="estado_slc" disabled required>
						<option value="<?php echo $registro_usuario['DirEst']; ?>"><?php echo $registro_usuario['DirEst']; ?></option>
					    <option value="0">Selecciona un Estado</option>
					    <option value="Aguascalientes">Aguascalientes</option>
					    <option value="Baja California Nte">Baja California Nte</option>
					    <option value="Baja California Sur">Baja California Sur</option>
					    <option value="Campeche">Campeche</option>
					    <option value="Coahuila">Coahuila</option>
					    <option value="Colima">Colima</option>
					    <option value="Chiapas">Chiapas</option>
					    <option value="Chihuahua">Chihuahua</option>
					    <option value="Sinaloa">Sinaloa</option>
					    <option value="Durango">Durango</option>
					    <option value="Guanajuato">Guanajuato</option>
					    <option value="Guerrero">Guerrero</option>
					    <option value="Hidalgo">Hidalgo</option>
					    <option value="Jalisco">Jalisco</option>
					    <option value="M&eacutexico">M&eacutexico</option>
					    <option value="Michoac&aacuten">Michoac&aacuten</option>
					    <option value="Morelos">Morelos</option>
					    <option value="Nayarit">Nayarit</option>
					    <option value="Nuevo Le&oacuten">Nuevo Le&oacuten</option>
					    <option value="Oaxaca">Oaxaca</option>
					    <option value="Puebla">Puebla</option>
					    <option value="Quer&eacutetaro">Quer&eacutetaro</option>
					    <option value="Quintana Roo">Quintana Roo</option>
					    <option value="San Lu&iacutes Potos&iacute">San Lu&iacutes Potos&iacute</option>
					    <option value="Sonora">Sonora</option>
					    <option value="Tabasco">Tabasco</option>
					    <option value="Tamaulipas">Tamaulipas</option>
					    <option value="Tlaxcala">Tlaxcala</option>
					    <option value="Veracruz">Veracruz</option>
					    <option value="Yucat&aacuten">Yucat&aacuten</option>
					    <option value="Zacatecas">Zacatecas</option>
					</select>
				</td>
				

			</tr>
			<tr>
				
				<td>
					<p>Correo Electronico:</p>
					<input  placeholder="ejemplo@correol.com" type="email" name="correo_txt" value="<?php echo $registro_usuario['CorEle']; ?>" disabled required >
				</td>
				<td>
					<p>Telefono 1:</p>
					<input placeholder="Telefono" type="text" name="tel_fijo_txt" value="<?php echo $registro_usuario['TelFij']; ?>" disabled required >
				</td>
				<td>
					<p>Telefono 2:</p>
					<input placeholder="Celular" type="text" name="cel_txt" value="<?php echo $registro_usuario['TelCel']; ?>" disabled>
				</td>
			</tr>
			<tr>
				<td>
					<p>Fecha de Nacimiento:</p>
					<input type= "date"  name="nacimiento_txt" value="<?php echo $registro_usuario['FecNac']; ?>" disabled required >
				</td>
				<td>
					<div class="sexo" >
						<p>Sexo:</p><br>
						<p>Fem:</p> <input type="radio" name="sexo_rdo" value="F" <?php if($registro_usuario["SexDat"]=="F"){ echo "checked";} ?> disabled required/>
						<p>Masc:</p><input type="radio" name="sexo_rdo" value="M"  <?php if($registro_usuario["SexDat"]=="M"){ echo "checked";} ?> disabled required/>
					</div>
				</td>
				<td>
					<p>RFC:</p>
					<input placeholder="RFC" type= "text"  name="rfc_txt" value="<?php echo $registro_usuario['RfcHom']; ?>" disabled>
				</td>
				</tr>


			<tr>
				<td>
					<p>Nombre de usuario:</p>
					<input placeholder="Nombre de usuario" type= "text"  name="usuario_txt" value="<?php echo $registro_usuario['UsuPer']; ?>"disabled required >
				    <input type="hidden" name="usuario_hdn" value="<?php echo $registro_usuario['UsuPer']; ?>">

				</td>
				<td>
					<p>Contrase&ntilde;a:</p>
					<input placeholder="Contrase&ntilde;a" type= "password"  name="contraseña_txt" value="<?php echo $registro_usuario['ConPas']; ?>" disabled required >
				</td>
				<td>
					<p>Repetir Contrase&ntilde;a:</p>
					<input placeholder="Repetir Contrase&ntilde;a" type= "password"  name="contraseña2_txt" value="<?php echo $registro_usuario['ConPas']; ?>" disabled required >
				</td>
				
			</tr>
		</table>
	 	<table>
	 		<h2>Direcci&oacute;n de env&iacute;o</h2>
	 		<tr>
				<td>
					<p>Calle y Numero:</p>
					<input placeholder="Calle y Numero" type="text" id="calle_env"name="calleenvio_txt"  value="<?php echo $registro_envio['DirCal']; ?>" disabled required>
				</td>
				<td>
					<p>Colonia :</p>
					<input placeholder="Colonia" type="text" id="col_env" name="colonianvio_txt" value="<?php echo $registro_envio['DirCol']; ?>" disabled required>
				</td>
				<td>
					<p>Codigo Postal:</p>
					<input placeholder="Codigo Postal" type="text" id="codigo_env"name="codigonvio_post_txt" value="<?php echo $registro_envio['CodPos']; ?>" disabled required >
				</td>
				
			</tr>

				<td>
					<p>Municipio:</p>
					<input placeholder="Municipio" type="text" id="mun_env"name="municipionvio_txt" value="<?php echo $registro_envio['DirMun']; ?>" disabled required >
				</td>
				<td>
					<p>Estado:</p>
					<select name="estadonvio_slc" id="estado_env" disabled required>
						<option value="<?php echo $registro_envio['DirEst']; ?>"><?php echo $registro_envio['DirEst']; ?></option>
					    <option value="0">Selecciona un Estado</option>
					    <option value="Aguascalientes">Aguascalientes</option>
					    <option value="Baja California Nte">Baja California Nte</option>
					    <option value="Baja California Sur">Baja California Sur</option>
					    <option value="Campeche">Campeche</option>
					    <option value="Coahuila">Coahuila</option>
					    <option value="Colima">Colima</option>
					    <option value="Chiapas">Chiapas</option>
					    <option value="Chihuahua">Chihuahua</option>
					    <option value="Sinaloa">Sinaloa</option>
					    <option value="Durango">Durango</option>
					    <option value="Guanajuato">Guanajuato</option>
					    <option value="Guerrero">Guerrero</option>
					    <option value="Hidalgo">Hidalgo</option>
					    <option value="Jalisco">Jalisco</option>
					    <option value="M&eacutexico">M&eacutexico</option>
					    <option value="Michoac&aacuten">Michoac&aacuten</option>
					    <option value="Morelos">Morelos</option>
					    <option value="Nayarit">Nayarit</option>
					    <option value="Nuevo Le&oacuten">Nuevo Le&oacuten</option>
					    <option value="Oaxaca">Oaxaca</option>
					    <option value="Puebla">Puebla</option>
					    <option value="Quer&eacutetaro">Quer&eacutetaro</option>
					    <option value="Quintana Roo">Quintana Roo</option>
					    <option value="San Lu&iacutes Potos&iacute">San Lu&iacutes Potos&iacute</option>
					    <option value="Sonora">Sonora</option>
					    <option value="Tabasco">Tabasco</option>
					    <option value="Tamaulipas">Tamaulipas</option>
					    <option value="Tlaxcala">Tlaxcala</option>
					    <option value="Veracruz">Veracruz</option>
					    <option value="Yucat&aacuten">Yucat&aacuten</option>
					    <option value="Zacatecas">Zacatecas</option>
					</select>
				</td>
				
				<td>
					<p>Referenc&iacute;a:</p>
					<input placeholder="Referencia" type="text" name="referencianvio_txt"value="<?php echo $registro_envio['RefDat']; ?>" disabled required >
				</td>
			

		</table>	
		<input type="hidden" name="numemp_hdn" value="<?php echo $registro_usuario["NumEmp"]; ?>">
		
		<?php
		echo "<input type='button' value='Atrás' onClick='history.go(-1);'>";
		?>

		<!-- <div class="terminos" style="padding: 1px 500px;"><input class="submit" type="submit" name="cambios_btn" value="Cambiar datos"></div>
		</form> -->
		</div>
	</body>
	<?php include("../parts/footer.html"); ?>
</HTML>