<!DOCTYPE html>
<html lang ="es">
    <head>
        <title>Cont&aacute;ctanos</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
        <script src="../js/jquery.validate.js" type="text/javascript"></script>
        <script src="../js/contacto.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="../parts/top.jsp" %>

        <div class="registro">

            <h1 style="padding:1px 20px; text-align: center;">
                &iquest;Tiene alguna duda, comentario o sugerencia&#63;, cont&aacute;ctenos:</h1>

            <p><strong>Correo electr&oacute;nico:</strong> atencionalcliente@maharannee.net </p>
            <p><strong>Tel&eacute;fonos:</strong> 4772291976 <br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4773126901</p>

            <h3>La forma m&aacute;s f&aacute;cil de contactarnos es usando el siguiente formulario:</h3>

            <form action="EnvioCorreo.jsp" method="post" id="FormC">
                <table style= "padding:1px 170px; text-align: center">
                    <tr>
                        <th><label>
                                Nombre:
                            </label></th>
                        <th><input size="67" name="nombre" type="text"/>
                        </th>
                    <br />
                    </tr>
                    <tr>
                        <th><label>
                                Asunto:
                            </label></th>
                        <th><input size="67" name="asunto" type="text"/>
                        </th>
                    <br />
                    </tr>
                    <tr>
                        <th><label>
                                Email:
                            </label></th>
                        <th><input size="67" name="email" type="text"/>
                        </th>
                    <br />
                    </tr>
                    <tr>
                        <th><label>
                                Mensaje:
                            </label></th>
                        <th><textarea name="mensaje" rows="6" cols="90"></textarea>
                        <th>
                            <br />
                    </tr>
                    <tr>
                        <th>
                            <!-- No borrar este espacio-->
                        </th>
                        <th>
                            <input type="submit" value="Enviar"/>
                            <input type="reset" value="Borrar" />
                        </th>
                    </tr>
                </table>
            </form>

        </div>

        <%@include file="../parts/footer.html" %>



    </body>
</HTML>