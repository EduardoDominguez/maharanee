<html lang="es">

    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        <title>Registro producto</title>
    </head>

    <body>
        <%
                          HttpSession objSesion2 = request.getSession(false);
                           String logeo3 = "";
                    
                           logeo3 = (String) objSesion2.getAttribute("logeo");
                    
                        if("admin".equals(logeo3)){
                        }else{
                           response.sendRedirect("../index.jsp");
        }
        %>
        <%@include file="../parts/top.jsp" %>

        <div class="registro">
            <form name="alta-producto" action="../AltaProductos" method="post" enctype="multipart/form-data">	

                <h2>Datos del producto</h2>
                <table>
                    <%                        if (request.getParameter("mensaje") != null) {
                            out.println(request.getParameter("mensaje"));
                        }
                    %>
                    <tr>
                    <td>
                        <p>Nombre:</p>
                        <input placeholder="Nombre del Producto" type="text" name="nombre_txt" required>
                    </td>
                    <td>
                        <p>C&oacute;digo:</p>
                        <input placeholder="C&oacute;digo del Producto" type="text" name="codigo_txt" required>
                    </td>
                    <td>
                        <p>Caracter&iacute;ticas:</p>
                        <input placeholder="Caracter&aacute;sticas" type="text" name="caract_txt" required>
                    </td>
                    </tr>
                    <tr>
                    <td>
                        <p>Medidas:</p>
                        <input placeholder="Medidas" type="text" name="medidas_txt"   required>
                    </td>
                    <td>
                        <p>Piezas:</p>
                        <input placeholder="Piezas" type="text" name="piezas_txt"   required>
                    </td>
                    <td>
                        <p>Precio de Venta:</p>
                        <input placeholder="Precio de Venta" type="text" name="precio_txt" required>
                    </td>
                    </tr>
                    <tr>
                    <td>
                        <p>Oferta del Producto:</p>
                        <input placeholder="Oferta del Producto" type="text" name="oferta_txt"   required>
                    </td>
                    <td>
                    <label for="categorias">Categor&iacute;as: </label>
                    <select id="categorias" class="cambio" name="categoria_slc" required>
                        <option value="">- - -</option>
                        <%@include file="../parts/select-categoria.jsp"%>
                    </select>
                    </td>
                    <td>
                        <p>Video del Producto:</p>
                        <input placeholder="Video del Producto" type="text" name="video_txt"   required>
                    </td>
                    </tr>		
                </table>	

                <table>
                    <tr>
                    <td>	
                    <label for="foto"> Imagen Grande:</label>
                    <input type="file" id="foto" name="fotog_fls" title="Sube tu foto"/>
                    </td>
                    <td>		
                    <label for="foto"> Imagen Uno:</label>
                    <input type="file" id="foto" name="foto1_fls" title="Sube tu foto"/>
                    </td>
                    </tr>
                    <tr>
                    <td>		
                    <label for="foto"> Imagen Dos:</label>
                    <input type="file" id="foto" name="foto2_fls" title="Sube tu foto"/>
                    </td>
                    <td>		
                    <label for="foto"> Imagen Caja:</label>
                    <input type="file" id="foto" name="fotoc_fls" title="Sube tu foto"/>
                    </td>
                    </tr>
                </table>		


                <div style="padding: 0px 500px;">
                    <input class="submit" type="submit" id="enviar" name="enviar_btn" value="Agregar">
                    <%                        if (request.getParameter("mensaje") != null) {
                            out.println(request.getParameter("mensaje"));
                        }
                    %>
                </div>


            </form>
        </div>

        <%@include file="../parts/footer.html" %>

    </body>
</HTML>
