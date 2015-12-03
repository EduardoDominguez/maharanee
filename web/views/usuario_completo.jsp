<%@page import="persistencia.conexion"%>
<HTML>
    <head>
        <title>Consultar usuarios</title>
        <meta charset="utf-8" />
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="../parts/top.jsp" %>
        <div class="registro">
            <!-- <form name="cambio_frm" action="modificar-contacto.php" method="post" enctype="multipart/form-data"> -->
            <%                conexion c = new conexion();
                String id = request.getParameter("id");
                Integer.parseInt(id);
                //out.print(id);
                String resultusuario[] = c.select("SELECT * from persona where NumEmp = " + id);
                System.out.print("SELECT * from persona where NumEmp = " + id);

                for (int i = 0; i < resultusuario.length; i++) {
                    System.out.print("res" + resultusuario[i]);
                    String splus[] = resultusuario[i].split(", ");
                    String sexo = splus[15];
                    System.out.println(sexo);
            %>
            <table>
                <h2>Datos personales</h2>
                <tr>
                <td>
                    <p>Nombre:</p>
                    <input placeholder="Nombre" type="text" name="nombre_txt" value="<%=splus[1]%>"  disabled required>
                </td>
                <td>
                    <p>Apellido Paterno:</p>
                    <input placeholder="Apellido Paterno" type="text" name="apepa_txt" value="<%=splus[2]%>" disabled required>
                </td>
                <td>
                    <p>Apellido Materno:</p>
                    <input placeholder="Apellido Materno" type="text" name="apema_txt" value="<%=splus[3]%>" disabled required>

                </td>
                </tr>
                <tr>
                <td>
                    <p>Calle y Numero:</p>
                    <input placeholder="Calle y Numero" type="text" name="calle_txt" value="<%=splus[4]%>" disabled required>
                </td>
                <td>
                    <p>Colonia :</p>
                    <input placeholder="Colonia" type="text" name="colonia_txt" value="<%=splus[5]%>" disabled required>
                </td>
                <td>
                    <p>Codigo Postal:</p>
                    <input placeholder="Codigo Postal" type="text" name="codigo_post_txt" value="<%=splus[9]%>" disabled required >
                </td>

                </tr>
                <tr>
                <td>
                    <p>Municipio:</p>
                    <input placeholder="Municipio" type="text" name="municipio_txt" value="<%=splus[6]%>" disabled required >
                </td>
                <td>
                    <p>Estado:</p>
                    <select name="estado_slc" disabled required>
                        <option value="<%=splus[7]%>"><%=splus[7]%></option>
                        <option value="0">Selecciona un Estado</option>
                        <option value="Aguascalientes">Aguascalientes</option>
                        <option value="Baja California Nte">Baja California Nte</option>
                        <option value="Baja California Sur">Baja California Sur</option>
                        <option value="Campeche">Campeche</option>
                        <option value="Coahuila">Coahuila</option>
                        <option value="Colima">Colima</option>
                        <option value="Chiapas">Chiapas</option>
                        <option value="Chihuahua">Chihuahua</option>
                        <option value="Sinaloa">Sinaloa</option>
                        <option value="Durango">Durango</option>
                        <option value="Guanajuato">Guanajuato</option>
                        <option value="Guerrero">Guerrero</option>
                        <option value="Hidalgo">Hidalgo</option>
                        <option value="Jalisco">Jalisco</option>
                        <option value="M&eacutexico">M&eacutexico</option>
                        <option value="Michoac&aacuten">Michoac&aacuten</option>
                        <option value="Morelos">Morelos</option>
                        <option value="Nayarit">Nayarit</option>
                        <option value="Nuevo Le&oacuten">Nuevo Le&oacuten</option>
                        <option value="Oaxaca">Oaxaca</option>
                        <option value="Puebla">Puebla</option>
                        <option value="Quer&eacutetaro">Quer&eacutetaro</option>
                        <option value="Quintana Roo">Quintana Roo</option>
                        <option value="San Lu&iacutes Potos&iacute">San Lu&iacutes Potos&iacute</option>
                        <option value="Sonora">Sonora</option>
                        <option value="Tabasco">Tabasco</option>
                        <option value="Tamaulipas">Tamaulipas</option>
                        <option value="Tlaxcala">Tlaxcala</option>
                        <option value="Veracruz">Veracruz</option>
                        <option value="Yucat&aacuten">Yucat&aacuten</option>
                        <option value="Zacatecas">Zacatecas</option>
                    </select>
                </td>


                </tr>
                <tr>

                <td>
                    <p>Correo Electronico:</p>
                    <input  placeholder="ejemplo@correol.com" type="email" name="correo_txt" value="<%=splus[12]%>" disabled required >
                </td>
                <td>
                    <p>Telefono 1:</p>
                    <input placeholder="Telefono" type="text" name="tel_fijo_txt" value="<%=splus[10]%>" disabled required >
                </td>
                <td>
                    <p>Telefono 2:</p>
                    <input placeholder="Celular" type="text" name="cel_txt" value="<%=splus[11]%>" disabled>
                </td>
                </tr>
                <tr>
                <td>
                    <p>Fecha de Nacimiento:</p>
                    <input type= "date"  name="nacimiento_txt" value="<%=splus[13]%>" disabled required >
                </td>
                <td>
                    <div class="sexo" >
                        <p>Sexo:</p><br>
                        <p>Fem:</p> <input type="radio" name="sexo_rdo" value="F" <% if ("F".equals(sexo)) {
                                out.print("checked");
                            }%> disabled required/>
                        <p>Masc:</p><input type="radio" name="sexo_rdo" value="M"  <% if ("M".equals(sexo)) {
                                out.print("checked");
                            }%> disabled required/>
                    </div>
                </td>
                <td>
                    <p>RFC:</p>
                    <input placeholder="RFC" type= "text"  name="rfc_txt" value="<%=splus[14]%>" disabled>
                </td>
                </tr>


                <tr>
                <td>
                    <p>Nombre de usuario:</p>
                    <input placeholder="Nombre de usuario" type= "text"  name="usuario_txt" value="<%=splus[17]%>"disabled required >
                    <input type="hidden" name="usuario_hdn" value="<%=splus[17]%>">

                </td>
                <td>
                    <p>Contrase&ntilde;a:</p>
                    <input placeholder="Contrase&ntilde;a" type= "password"  name="contraseña_txt" value="<%=splus[18]%>" disabled required >
                </td>
                <td>
                    <p>Repetir Contrase&ntilde;a:</p>
                    <input placeholder="Repetir Contrase&ntilde;a" type= "password"  name="contraseña2_txt" value="<%=splus[18]%>" disabled required >
                </td>

                </tr>
            </table>
            <input type="hidden" name="numemp_hdn" value="<%=splus[0]%>">
            <% }%>
            <!--<?php
            echo "<input type='button' value='Atrás' onClick='history.go(-1);'>";
            ?>-->

            <!-- <div class="terminos" style="padding: 1px 500px;"><input class="submit" type="submit" name="cambios_btn" value="Cambiar datos"></div>
            </form> -->
        </div>
    </body>
    <%@include file="../parts/footer.html" %>
</HTML>