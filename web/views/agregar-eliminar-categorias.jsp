<!--<?php error_reporting(E_ALL ^ E_NOTICE ); 
session_start(); 
if(isset($_SESSION['admin']))
{
}
else {
        header("Location: ../index.php");
    exit;
}
?>-->
<HTML>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
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
            <form action="../Categoria" method="post" enctype ='application/x-www-form-urlencoded'>	
                <h2>Agregar nueva categor&iacute;a</h2>
                <table>
                    <tr>
                        <td>
                            <p>Nombre de la categor&iacute;a:</p>
                            <input placeholder="Nombre" type="text" name="nombre_cat_txt" required>
                            <input  type="hidden"  id="opcion" name="opcion" value="1"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="submit" type="submit" id="enviar" value="Agregar">
                        </td>
                    </tr>
                    <!--<?php echo $_GET["mensaje"];  ?>-->
                </table>
            </form>
        </div>
        <div class="registro">
            <form action="../Categoria" method="post" enctype ='application/x-www-form-urlencoded'>	
                <h2>Dar de baja categor&iacute;a</h2>
                <table>
                    <tr>
                    <label for="categorias">Categor&iacute;as: </label>
                    <select id="categorias" class="cambio" name="categoria_slc" required>
                        <option value="">- - -</option>
                         <%@include file="../parts/select-categoria.jsp"%> 
                         <input  type="hidden"  name="opcion" value="2"/>
                    </select>
                    </tr>
                    <tr>
                        <td>
                            <input class="submit" type="submit" id="enviar" name="baja_btn" value="Dar de baja categor&iacute;a">
                        </td>
                    </tr>
                    <!--<?php echo $_GET["mensaje2"];  ?>-->
                </table>

            </form>
        </div>

        <div class="registro">
            <form action="../Categoria" method="post" enctype ='application/x-www-form-urlencoded'>
                <h2>Reactivar categor&iacute;a</h2>
                <table>
                    <tr>
                        <td>
                            <p>Nombre de la categor&iacute;a:</p>
                            <input placeholder="Nombre" type="text" name="nombre_cat_txt" required>
                            <input  type="hidden"  name="opcion" value="3"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="submit" type="submit" id="enviar" name="reactivar_btn" value="Reactivar categor&iacute;a">
                        </td>
                    </tr>
                    <!--<?php echo $_GET["mensaje3"];  ?>-->
                </table>

            </form>
        </div>

        <%@include file="../parts/footer.html" %>

    </body>
</HTML>
