<html lang="es">
    <head>
        <title>Reportes</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <meta name="viewport" content="width=device-width; initial-scale=1.0" />

    </head>
    <body>
        <%@include file="../parts/top.jsp" %>
        <div class="pagofacil">
            <header>
                <h1>Reportes</h1>
            </header>

            <div>
                <p style="text-align: center;"> Seleccione el reporte a generar:</p>
                <p style="color:blue;">Productos</p>
                <a href="reporteproductos.jsp">
                    <input class="transban" id="enviar" name="repoprod" value="Reporte de los productos" type="submit">
                </a>
                <br>
                <p style="color:blue;">Pedidos</p>
                <form action="reportepedidos.jsp" method="POST">
                    Usuario: <input type="text" name="usuario" required><br><br>
                    <input class="transban" id="enviar" name="repopedi" value="Reporte de los pedidos" type="submit">
                </form>
            </div>

            <footer>
                <p>
                    Debe de contar con el programa Microsoft Excel o software similar para ver los reportes.
                </p>
            </footer>
        </div>
    </body>
    <%@include file="../parts/footer.html" %>
</html>