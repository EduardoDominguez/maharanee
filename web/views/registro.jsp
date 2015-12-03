
<HTML>
	<head>
		<title>Registro</title>
		<meta charset="utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/default.css">
		<link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
		
  		
	</head>
	
	<body>
            
	        <%@include file="../parts/top.jsp" %>

	<div class="registro">
		<form action="../RegistroUsuario" method="post" enctype ='application/x-www-form-urlencoded'>	
		<table>
			<h1>Registro</h1>
			<h2>Datos del solicitante</h2>
			<p>(<strong style="color: red;">*</strong>) Campo obligatorio</p>
			<tr>
				<td>
					<p><strong style="color: red;">*</strong>Nombre(s):</p>
					<input placeholder="Nombre(s)" type="text" name="nombre_txt" >
				</td>
				<td>
					<p><strong style="color: red;">*</strong>Apellido Paterno:</p>
					<input placeholder="Apellido Paterno" type="text" name="apepa_txt" >
				</td>
				<td>
					<p><strong style="color: red;">*</strong>Apellido Materno:</p>
					<input placeholder="Apellido Materno" type="text" name="apema_txt" >
				</td>
			</tr>
			<tr>
				<td>
					<p><strong style="color: red;">*</strong>Calle y Numero:</p>
					<input placeholder="Calle y Numero" type="text" id="calle_sol" name="calle_txt" >
				</td>
				<td>
					<p><strong style="color: red;">*</strong>Colonia:</p>
					<input placeholder="Colonia" type="text" id="col_sol" name="colonia_txt" >
				</td>
				<td>
					<p><strong style="color: red;">*</strong>Codigo Postal:</p>
					<input placeholder="Codigo Postal" type="text" id="codigo_sol" name="codigo_post_txt"  >
				</td>
				
			</tr>
			<tr>
				<td>
					<p><strong style="color: red;">*</strong>Municipio:</p>
					<input placeholder="Municipio" type="text" id="mun_sol" name="municipio_txt"  >
				</td>
				<td>
					<p><strong style="color: red;">*</strong>Estado:</p>
					<select name="estado_slc" id="estado_sol" >
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
					<p><strong style="color: red;">*</strong>Correo Electronico:</p>
					<input  placeholder="ejemplo@correol.com" type="email" name="correo_txt"  >
				</td>
				<td>
					<p><strong style="color: red;">*</strong>Telefono 1:</p>
                                        <input placeholder="Telefono" type="number" name="tel_fijo_txt"  >
				</td>
				<td>
					<p>Telefono 2:</p>
                                        <input placeholder="Celular" type="number" name="cel_txt" >
				</td>
			</tr>
			<tr>
				<td>
					<p><strong style="color: red;">*</strong>Fecha de Nacimiento:</p>
					<input placeholder="AAAA-MM-DD" type="date" name="nacimiento_txt"  >
				</td>
				<td>
					<div class="sexo" >
						<p><strong style="color: red;">*</strong>Sexo:</p><br>
						<p>Fem:</p> <input type="radio" name="sexo_rdo" value="F" />
						<p>Masc:</p><input type="radio" name="sexo_rdo" value="M"  />
					</div>
				</td>
				<td>
					<p>RFC:</p>
					<input placeholder="RFC" type= "text"  name="rfc_txt">
				</td>
			</tr>
			
			<tr>
				<td>
					<p><strong style="color: red;">*</strong>Usuario:</p>
					<input id="UserU" placeholder="Usuario" type= "text"  name="usuario_txt"  >
					
				</td>
				<!--<td></td>
				<td></td>-->
				<td>
					<p><strong style="color: red;">*</strong>Contrase&ntilde;a:</p>
					<input placeholder="Contrase&ntilde;a" type="password"  name="contrasena_txt"  >
				</td>
				<td>
					<p><strong style="color: red;">*</strong>Repetir Contrase&ntilde;a:</p>
					<input placeholder="Repetir Contrase&ntilde;a" type="password"  name="contrasena2_txt"  >
				</td>

			</tr>
			
	 	</table>
	 	
		<div class="terminos" style="padding: 1px 170px;">
			<p><strong style="color: red;">*</strong>Acepto los <a target="_blank" href="../views/terminos_condiciones.php">terminos y condiciones</a>. 
				<input type="checkbox" name="terminos_cond_txt" >
			</p>
			<p><strong style="color: red;">*</strong>Acepto <a target="_blank" href="../views/contrato.php">contrato</a> con Maharanee. 
				<input type="checkbox" name="contrato_txt" >
			</p>
			<br />
			<br />
			<input type=submit name=accion value=GUARDAR class=button />
		</div>
		</form>
            <%@include file="../parts/footer.html" %>

</div>
</body>

</HTML>
