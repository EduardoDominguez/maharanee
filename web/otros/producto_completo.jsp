<?php 
include("sesion.php");

?>
<HTML>
    <head>
        <title>Modificar Producto</title>
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
            <form name="producto_frm" action="modificar-productos.php" method="post" enctype="multipart/form-data">

                <?php
                if($_SESSION["admin"])
                {
                @$id=$_GET['id'];
                @$palabra=$_GET['clave'];

                include("conexion.php");

                $consulta_producto = "SELECT * from producto where IdProd = '$id'";
                $ejecutar_consulta_producto = $conexion->query($consulta_producto);
                $registro_producto = $ejecutar_consulta_producto->fetch_assoc();
                $num_regs = $ejecutar_consulta_producto->num_rows;

                if ($num_regs==0) {
                $consulta_producto = "SELECT * from producto where NomPro like '%$palabra%'";
                $ejecutar_consulta_producto = $conexion->query($consulta_producto);
                $registro_producto = $ejecutar_consulta_producto->fetch_assoc();
                }

                $idprod = $registro_producto["IdProd"];

                $consulta_categoria ="SELECT * from categoria
                join producto on producto.categoria_IdCate = categoria.IdCate
                where producto.IdProd = '$idprod';";
                $ejecutar_consulta_categoria = $conexion->query($consulta_categoria);
                $registro_categoria = $ejecutar_consulta_categoria->fetch_assoc();

                }

                ?>

                <table>
                    <br />
                    <br />
                    <h2>Modificar producto</h2>
                    <tr>
                        <td>
                            <p>Nombre:</p>
                            <input placeholder="Nombre del Producto" type="text" name="nombre_txt" value="<?php echo $registro_producto['NomPro']; ?>" required>
                            <input type="hidden" name="id_hdn" value="<?php echo $registro_producto['IdProd']; ?>" required>
                        </td>
                        <td>
                            <p>C&oacute;digo:</p>
                            <input placeholder="Codigo del Producto" type="text" name="codigo_txt" value="<?php echo $registro_producto['CodPro']; ?>" required>
                            <input type="hidden" name="codigoanterior_txt" value="<?php echo $registro_producto['CodPro']; ?>" required>
                        </td>	
                    </tr>

                    <tr>
                        <td>
                            <p>Características:</p>
                            <input placeholder="Caracteristicas" type="text" name="caract_txt" value="<?php echo $registro_producto['CarPro']; ?>" required>
                        </td>
                        <td>
                            <p>Medidas:</p>
                            <input placeholder="Medidas" type="text" name="medidas_txt" value="<?php echo $registro_producto['MedPro']; ?>" required>
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
                            <p>Oferta del Producto:</p>
                            <input placeholder="Oferta Producto" type="text" name="oferta_txt" value="<?php echo $registro_producto['OfePro']; ?>" required>
                        </td>
                        <td>
                            <p>Estado del Producto:</p>
                            <input placeholder="Oferta Producto" type="text" name="estado_txt" value="<?php echo $registro_producto['EstPro']; ?>" required>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="categorias">Categorías: </label>
                            <select id="categorias" class="cambio" name="categoria_slc" required>
                                <option value="<?php echo $registro_categoria['IdCate']; ?>"><?php echo $registro_categoria['NomCat']; ?></option>
                                <?php include("categorianum2.php"); ?>
                            </select>
                        </td>
                        <td>
                            <p>Video del Producto:</p>
                            <input placeholder="Video" type="text" name="video_txt" value="<?php echo $registro_producto['VidPro']; ?>" required>
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

            </form>
        </div>
    </body>
    <?php include("../parts/footer.html"); ?>
</HTML>