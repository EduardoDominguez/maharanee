<HTML>
    <head>
        <title>Modificar Inicio</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    </head>
    <body>

        <%@include file="../parts/top.jsp" %>
        <%                     HttpSession objSesion2 = request.getSession(false);
            String logeo3 = "";
            logeo3 = (String) objSesion2.getAttribute("logeo");

            if ("admin".equals(logeo3)) {
            } else {
                response.sendRedirect("../index.jsp");

            }
        %>
        <div class="registro">
            <form  action="../ModificarInicio" method="post" enctype ='application/x-www-form-urlencoded'>	

                <table>
                    <h2>Modificar elementos del inicio</h2>
                    <tr>
                        <td>
                            <p>Texto:</p>
                            <%@include file="../parts/datos_modificainicio.jsp"%> 
                            <input  type="hidden"  id="opcion" name="opcion" value="2"/>       
                        </td>
                    </tr>	
                </table>	
                <div class="terminos" style="padding: 1px 392px;">
                    <input class="submit" type="submit" name="enviar_btn" value="Modificar">
                </div>	

            </form>
        </div>
        <%@include file="../parts/footer.html" %>
    </body>
</HTML>
