<!--<?php 
session_start(); 
if(isset($_SESSION['admin']))
{
}
else {
header("Location: ../index.php");
exit;
}
?> -->
<!DOCTYPE HTML>
<html>
    <head>
        <%
            HttpSession objSesion2 = request.getSession(false);
            String logeo3 = "";

            logeo3 = (String) objSesion2.getAttribute("logeo");

            if ("admin".equals(logeo3)) {
            } else {
                response.sendRedirect("../index.jsp");

            }
        %>
         <link rel="stylesheet" type="text/css" href="../css/default.css">
        <style type="text/css">
            #caja_busqueda /*estilos para la caja principal de busqueda*/
            {
                width:400px;
                height:25px;
                border:solid 2px #979DAE;
                font-size:16px;
            }
            #display /*estilos para la caja principal en donde se puestran los resultados de la busqueda en forma de lista*/
            {
                width:400px;
                display:none;
                overflow:hidden;
                z-index:10;
                border: solid 1px #666;
            }
            .display_box /*estilos para cada caja unitaria de cada usuario que se muestra*/
            {
                padding:2px;
                padding-left:6px; 
                font-size:18px;
                height:63px;
                text-decoration:none;
                color:#3b5999; 
            }
            .display_box:hover /*estilos para cada caja unitaria de cada usuario que se muestra. cuando el mause se pocisiona sobre el area*/
            {
                background: #7f93bc;
                color: #FFF;
            }
            .desc
            {
                color:#666;
                font-size:16;
            }
            .desc:hover
            {
                color:#FFF;
            }

            /* Easy Tooltip */
        </style>
        <script language="JavaScript" src="../js/jquery-1.11.1.min.js"></script>
        <script language="JavaScript" src="../js/jquery.watermarkinput.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {

                $(".busca").keyup(function () //se crea la funcioin keyup
                {
                    var texto = $(this).val();//se recupera el valor de la caja de texto y se guarda en la variable texto
                    var dataString = 'palabra=' + texto;//se guarda en una variable nueva para posteriormente pasarla a search.php
                    if (texto == '')//si no tiene ningun valor la caja de texto no realiza ninguna accion
                    {
                    }
                    else
                    {
                        $.post('../BuscarUsuarios', {
                            palabra: texto
                        }, function (responseText) {
                            $("#display").html(responseText).show()
                        });
                    }
                    return false;
                });
            });
            jQuery(function ($) {//funcion jquery que muestra el mensaje "Buscar amigos..." en la caja de texto
                $("#caja_busqueda").Watermark("Buscar usuarios...");
            });
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Consultar usuarios</title>
    </head>

    <body>
        <%@include file="../parts/top.jsp" %>
        <div class="registro" style="padding-bottom: 350px;">
            <h2 style="text-align: center;">Consultar usuarios</h2>

            <form action="../Usuario" method="get">
                <div style=" width:250px; padding-left:150px; " >
                    <input type="text" class="busca" id="caja_busqueda" name="clave" /><br />
                </div>
                <div id="display" style="margin-left: 150px;"></div>
            </form>
    </body>
<%@include file="../parts/footer.html" %>
</html>