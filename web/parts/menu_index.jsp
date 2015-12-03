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

                    <!-- si es Usurario y administrador-->
                    <li><a href='cambios-usuario.jsp'>Modificar Perfil</a></li>
                    <li><a href='registro-compra-usu.jsp'>Ver Compras</a></li>

                    <!-- solo ADministrador -->
                    <li><a href='modificar_index.jsp'>Modificar Inicio</a></li>
                    <li><a href='buscar_usuarios.jsp'>Consultar Usuarios</a></li>
                    <li><a href='agregar-eliminar-categorias.jsp'>Modificar Categoriass</a></li>
                    <li><a href='registro-productos.jsp'>Agregar Productos</a></li>
                    <li><a href='buscar_producto.jsp'>Modificar Productos</a></li>
                    <li><a href='descuentos.jsp'>Modificar Descuentos</a></li>
                    <li><a href='registro-compra.jsp'>Registro de Compras</a></li>
                    <li><a href='reportes.jsp'>Reportes</a></li>




                </ul>
            </nav>
        </div>

    </body>
</HTML>