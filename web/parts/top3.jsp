


<HTML>
    <head>
        <link rel="stylesheet" type="text/css" href="css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
    </head>

    <body>
        <div class="top">
            <span><img src="img/logo.jpg" alt="logo" width="250" height="125"></span>
            <%
                HttpSession objSesion = request.getSession(false);
                String usuario = "", admin = "", logeo="";
                usuario = (String) objSesion.getAttribute("usuario");
                admin = (String) objSesion.getAttribute("admin");
                logeo = (String) objSesion.getAttribute("logeo");

               

                    if ("admin".equals(logeo) || "usuario".equals(logeo)) {
                        String name=objSesion.getAttribute("name").toString();
                        out.print("<span class='carrito'>"
                                + "<img width='50px' height='50px' src='img/carrito.png'>"
                                + "<p><a href='views/carrito.jsp'>Carrito</a></p>"
                                + "</span>"
                                + "<br></br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp"
                                + "<span>Bienvenido: "+name+"</span>"
                                + "<form action= 'InicioSesion' method='post' enctype ='application/x-www-form-urlencoded'>"
                                + "<p><input type='submit' name='Salir'value='Salir'></p>"
                                + "</form>");

                    } else {
                        out.print("<form action= 'InicioSesion' method='post' enctype ='application/x-www-form-urlencoded'>"
                                + "<span class='l'>"
                                + "<p>Usuario:</p> "
                                + "<p>Contrase&ntildea:</p>"
                                + "<p class='linkreg'><a href='views/registro.jsp'>¡Registro gratis!</a></p>"
                                + "</span>");

                        out.print("<span class='r'>"
                                + "<p><input type='text' name='usuario_txt'></p>"
                                + "<p><input type='password' name='pwd'></p>"
                                + "<p><input type='submit' name='Accesar'value='Accesar'></p>"
                                + "</span>"
                                + "</form>");

                    }
            %>





        </div>
        <div class="top_menu">
            <nav>
                <ul>
                    <li><a href="index.jsp">Inicio</a></li>
                    <li><a href="views/preguntas_frecuentes.jsp">Preguntas Frecuentes</a></li>
                    <li><a href="views/quienes_somos.jsp">Quienes Somos</a></li>
                    <li><a href="views/productos.jsp?categoria=1">Accesorios y Joyeria</a></li>
                    <li><a class="topcf" href="views/inicio_facil.jsp">Comienza Facil</a></li>
                    <li><a href="views/contactanos.jsp">Contactanos</a></li>
                </ul>
            </nav>
        </div>
    </body>
</HTML>