<HTML>
    <head>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    </head>

    <body>

        <div class="menu_index">
            <nav>
                <p>Accesorios y Joyeria</p>
                <ul>
                    <!-- Aqui va un despliegue con todas 
                    las categorias -->    
                    <%@include file="categorias_menu.jsp" %>

                    <p>Panel de control</p>

                    <!-- si es Usurario -->
                    <%
                        HttpSession objSesion2 = request.getSession(false);
                        String logeo2 = "";
                        logeo2 = (String) objSesion2.getAttribute("logeo");

                        if ("admin".equals(logeo2)) {
                            out.print("  <li><a href='views/modificar_index.jsp'>Modificar Inicio</a></li>"
                                    + "<li><a href='views/buscar_usuarios.jsp'>Consultar Usuarios</a></li>"
                                    + "<li><a href='views/agregar-eliminar-categorias.jsp'>Modificar Categor&iacute;as</a></li>"
                                    + "<li><a href='views/registro-productos.jsp'>Agregar Productos</a></li>"
                                    + "<li><a href='views/buscar_producto.jsp'>Modificar Productos</a></li>"
                                    + "<li><a href='views/descuentos.jsp'>Modificar Descuentos</a></li>"
                                    + "<li><a href='views/registro-compra.jsp'>Registro de Compras</a></li>"
                                    + "<li><a href='views/reportes.jsp'>Reportes</a></li>");
                        } else if ("usuario".equals(logeo2)) {
                            out.print("<li><a href='views/cambios-usuario.jsp'>Modificar Perfil</a></li>"
                                    + "<li><a href='views/registro-compra-usu.jsp'>Ver Compras</a></li>");
                        }
                    %>


                </ul>
            </nav>
        </div>

    </body>

</HTML>