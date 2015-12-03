<%@page import="persistencia.conexion"%>
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
        <%@include file="../parts/top.jsp" %>
        <div class="registro">
            <form name="producto_frm" action="../ModificarProducto" method="post" enctype="multipart/form-data">
                <%
                    String res[];
                    String id = request.getParameter("id");
                    String palabra = request.getParameter("palabra");
                    conexion c = new conexion();
                    res = c.select("SELECT * from producto where IdProd = '" + id + "'");
                    if (res[0].equals("fail")) {
                        res = c.select("SELECT * from producto where NomPro like '%" + palabra + "%'");
                    }
                    String spl[] = res[0].split(", ");
                    String rescat[] = c.select("Select * from categoria where idCate = " + spl[14]);
                    String splcat[] = rescat[0].split(", ");
                    c.cerrarConexion();
                %>

                <table>
                    <br />
                    <br />
                    <h2>Modificar producto</h2>
                    <tr>
                        <td>
                            <p>Nombre:</p>
                            <input placeholder="Nombre del Producto" type="text" name="nombre_txt" value="<%=spl[6]%>" required>
                            <input type="hidden" name="id_hdn" value="<%=spl[0]%>" required>
                        </td>
                        <td>
                            <p>C&oacute;digo:</p>
                            <input placeholder="Codigo del Producto" type="text" name="codigo_txt" value="<%=spl[7]%>" required>
                            <input type="hidden" name="codigoanterior_txt" value="<%=spl[7]%>" required>
                        </td>	
                    </tr>

                    <tr>
                        <td>
                            <p>Caracter&iacute;sticas:</p>
                            <input placeholder="Caracteristicas" type="text" name="caract_txt" value="<%=spl[8]%>" required>
                        </td>
                        <td>
                            <p>Medidas:</p>
                            <input placeholder="Medidas" type="text" name="medidas_txt" value="<%=spl[9]%>" required>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p>Piezas:</p>
                            <input placeholder="Piezas" type="text" name="piezas_txt" value="<%=spl[10]%>" required>
                        </td>
                        <td>
                            <p>Precio de Venta:</p>
                            <input placeholder="Precio de Venta" type="text" name="precio_txt" value="<%=spl[11]%>" required>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <p>Oferta del Producto:</p>
                            <input placeholder="Oferta Producto" type="text" name="oferta_txt" value="<%=spl[12]%>" required>
                        </td>
                        <td>
                            <p>Estado del Producto:</p>
                            <input placeholder="Estado Producto" type="text" name="estado_txt" value="<%=spl[13]%>" required>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label for="categorias">Categor&iacute;as: </label>
                            <select id="categorias" class="cambio" name="categoria_slc" required>
                                <option value="<%=splcat[0]%>"><%=splcat[1]%></option>
                                <%@include file="../parts/categorianum2.jsp"%>
                            </select>
                        </td>
                        <td>
                            <p>Video del Producto:</p>
                            <input placeholder="Video" type="text" name="video_txt" value="<%=spl[5]%>" required>
                        </td>
                    </tr>
                </table>

                <table>	
                    <tr>
                        <td>	
                            <label for="foto"> Imagen Grande:</label>
                            <input type="file" id="foto" name="fotog_fls" title="Sube tu foto"/>
                            <input type="hidden" name="fotog_hdn" value="<%=spl[1]%>"/>     

                        </td>
                        <td>
                            <img width="50%" height="50%" src="../img/Aretes/<%=spl[1]%>">
                        </td>
                    </tr>
                    <tr>	
                        <td>	
                            <label for="foto"> Imagen Uno:</label>
                            <input type="file" id="foto" name="foto1_fls" title="Sube tu foto"/>
                            <input type="hidden" name="foto1_hdn" value="<%=spl[2]%>"/>  
                        </td>
                        <td>
                            <img width="50%" height="50%" src="../img/Aretes/<%=spl[2]%>">
                        </td>
                    </tr>	
                    <tr>
                        <td>
                            <label for="foto"> Imagen Dos:</label>
                            <input type="file" id="foto" name="foto2_fls" title="Sube tu foto"/>
                            <input type="hidden" name="foto2_hdn" value="<%=spl[3]%>"/>  
                        </td>
                        <td>
                            <img width="50%" height="50%"src="../img/Aretes/<%=spl[3]%>">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="foto"> Imagen Caja:</label>
                            <input type="file" id="foto" name="fotoc_fls" title="Sube tu foto"/>
                            <input type="hidden" name="fotoc_hdn" value="<%=spl[4]%>"/>  
                        </td>
                        <td>
                            <img width="50%" height="50%" src="../img/Aretes/<%=spl[4]%>">
                        </td>
                    </tr>
                </table>


                <div style="padding: 1px 500px;">
                    <input class="submit" type="submit" id="enviar"name="producto_btn" value="Modificar">
                    <%
                        if (request.getParameter("mensaje") != null) {
                            out.println(request.getParameter("mensaje"));
                        }
                    %>
                </div>

            </form>
        </div>
    </body>
    <%
        if (request.getParameter("mensaje") != null) {
            out.println(request.getParameter("mensaje"));
        }
    %>
</HTML>