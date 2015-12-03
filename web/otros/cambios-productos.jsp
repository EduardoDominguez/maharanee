<?php //error_reporting(E_ALL ^ E_NOTICE );?>
		<table>
			<br />
			<br />
			<h2>Modificar producto</h2>
			<tr>
				<td>
					<p>Nombre:</p>
					<input placeholder="Nombre del Producto" type="text" name="nombre_txt" value="<?php echo $registro_producto['NomPro']; ?>" required>
				</td>
				<td>
					<p>Codigo:</p>
					<input placeholder="Codigo del Producto" type="text" name="codigo_txt" value="<?php echo $registro_producto['CodPro']; ?>" required>
					<input type="hidden" name="codigoanterior_txt" value="<?php echo $registro_producto['CodPro']; ?>" required>
				</td>	
			</tr>

			<tr>
				<td>
					<p>Medidas:</p>
					<input placeholder="Medidas" type="text" name="medidas_txt" value="<?php echo $registro_producto['MedPro']; ?>" required>
				</td>
				<td>
					<p>Caracteristicas:</p>
					<input placeholder="Caracteristicas" type="text" name="caract_txt" value="<?php echo $registro_producto['CarPro']; ?>" required>
				</td>
			</tr>
			
			<tr>
				<td>
					<p>Piezas:</p>
					<input placeholder="Piezas" type="text" name="piezas_txt" value="<?php echo $registro_producto['PiePro']; ?>" required>
				</td>
				<td>
					<p>Precio de Venta:</p>
					<input placeholder="Precio de Venta" type="text" name="precio_txt" value="<?php echo $registro_producto['PreVen']; ?>" required>
				</td>
			</tr>
					
			<tr>
				<td>
					<p>Oferta Producto:</p>
					<input placeholder="Oferta Producto" type="text" name="oferta_txt" value="<?php echo $registro_producto['OfePro']; ?>" required>
				</td>
				<td>
					<p>Estado Producto:</p>
					<input placeholder="Oferta Producto" type="text" name="estado_txt" value="<?php echo $registro_producto['EstPro']; ?>" required>
				</td>
			</tr>
			
			<tr>
				<td>
				<label for="categorias">Categorias: </label>
					<select id="categorias" class="cambio" name="categoria_slc" required>
						<option value="<?php echo $registro_categoria['IdCate']; ?>"><?php echo $registro_categoria['NomCat']; ?></option>
						<?php include("categorianum2.php"); ?>
					</select>
				</td>
			</tr>
			</table>
			
			<table>	
				<tr>
					<td>	
						<label for="foto"> Imagen Grande:</label>
						<input type="file" id="foto" name="fotog_fls" title="Sube tu foto"/>
						<input type="hidden" name="fotog_hdn" value="<?php echo $registro_producto["ImaGra"]; ?>"/>     
					
					</td>
					<td>
						<img width="50%" height="50%" src="<?php echo "../img/Aretes/".$registro_producto['ImaGra']; ?>">
					</td>
				</tr>
				<tr>	
					<td>	
						<label for="foto"> Imagen Uno:</label>
						<input type="file" id="foto" name="foto1_fls" title="Sube tu foto"/>
						<input type="hidden" name="foto1_hdn" value="<?php echo $registro_producto["ImaUno"]; ?>"/>  
					</td>
					<td>
						<img width="50%" height="50%" src="<?php echo "../img/Aretes/".$registro_producto['ImaUno']; ?>">
					</td>
				</tr>	
				<tr>
					<td>
						<label for="foto"> Imagen Dos:</label>
						<input type="file" id="foto" name="foto2_fls" title="Sube tu foto"/>
						<input type="hidden" name="foto2_hdn" value="<?php echo $registro_producto["ImaDos"]; ?>"/>  
					</td>
					<td>
						<img width="50%" height="50%"src="<?php echo "../img/Aretes/".$registro_producto['ImaDos']; ?>">
					</td>
				</tr>
				<tr>
					<td>
					<label for="foto"> Imagen Caja:</label>
					<input type="file" id="foto" name="fotoc_fls" title="Sube tu foto"/>
					<input type="hidden" name="fotoc_hdn" value="<?php echo $registro_producto["ImaCaj"]; ?>"/>  
					</td>
					<td>
					<img width="50%" height="50%" src="<?php echo "../img/Aretes/".$registro_producto['ImaCaj']; ?>">
					</td>
				</tr>
			</table>
			
			
			<div style="padding: 1px 500px;">
				<input class="submit" type="submit" id="enviar"name="producto_btn" value="Modificar">
				<?php echo $_GET["mensaje"]; ?>
			</div>
			

