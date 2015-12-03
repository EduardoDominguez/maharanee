<%@page import="persistencia.conexion"%>
<HTML>
    <head>
        <title>Agregar descuentos</title>
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

            if ("admin".equals(logeo3)) {
            } else {
                response.sendRedirect("../index.jsp");

            }
        %>
        <%@include file="../parts/top.jsp" %>

        <div class="registro">
            <form name="alta_persona" action="../Descuento" method="post" enctype ='application/x-www-form-urlencoded'>	
                <% 
                    conexion c = new conexion();
                    //out.print(id);
                    String resultdes[] = c.select("SELECT * from descuento where IdDesc = 1");
                    for (int i = 0; i < resultdes.length; i++) {
                        System.out.print("res" + resultdes[i]);
                        String spldes[] = resultdes[i].split(", ");
                %>

                <table>
                    <h2>Agregar descuentos por total de compras</h2>
                    <tr>
                    <td>
                        De $0 a $14,999
                        <p>Descuento 1:</p>
                        <input placeholder="Descuento 1" type="text" value="<%=spldes[1]%>" name="d1_txt" required>
                    </td>
                    <td>
                        De $15,000 en adelante
                        <p>Descuento 2:</p>
                        <input placeholder="Descuento 2" type="text" value="<%=spldes[2]%>" name="d2_txt" required>
                    </td>
                    </tr>	
                </table>	
                <div class="terminos" style="padding: 1px 385px;">
                    <input class="submit" type="submit" name="enviar_btn" value="Cambiar">
                </div>	
                <% }%>
            </form>
        </div>
        <%@include file="../parts/footer.html" %>
    </body>
</HTML>
