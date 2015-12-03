<%@page import="persistencia.conexion"%>

<HTML>
    <head>
        <meta charset="utf-8" />
        <title>Modificar Perfil</title>
        <link rel="stylesheet" type="text/css" href="../css/default.css">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            HttpSession objSesion = request.getSession(false);
            String numeroUsu = "";
            numeroUsu = (String) objSesion.getAttribute("numeroUSu");

            conexion c = new conexion();
            String res[] = c.select("SELECT * from persona where NumEmp = '" + numeroUsu + "'");
            String spl[] = res[0].split(", ");

        %>  
        <div class="registro">
            <form name="cambio_frm" action="../ModificarUsuario" method="post" enctype ='application/x-www-form-urlencoded'>


                <table>
                    <h2>Datos personales</h2>
                    <input type="hidden" name="num_usu" value="<%= numeroUsu%>">
                    <tr>
                    <td>
                        <p>Nombre:</p>
                        <input placeholder="Nombre" type="text" name="nombre_txt" value="<%= spl[1]%>"  >
                    </td>
                    <td>
                        <p>Apellido Paterno:</p>
                        <input placeholder="Apellido Paterno" type="text" name="apepa_txt" value="<%= spl[2]%>" >
                    </td>
                    <td>
                        <p>Apellido Materno:</p>
                        <input placeholder="Apellido Materno" type="text" name="apema_txt" value="<%= spl[3]%>" >

                    </td>



                    </tr>
                    <tr>
                    <td>
                        <p>Calle y Numero:</p>
                        <input placeholder="Calle y Numero" type="text" name="calle_txt" value="<%= spl[4]%>">
                    </td>
                    <td>
                        <p>Colonia :</p>
                        <input placeholder="Colonia" type="text" name="colonia_txt" value="<%= spl[5]%>">
                    </td>
                    <td>
                        <p>Codigo Postal:</p>
                        <input placeholder="Codigo Postal" type="text" name="codigo_post_txt" value="<%= spl[9]%>" >
                    </td>

                    </tr>
                    <tr>
                    <td>
                        <p>Municipio:</p>
                        <input placeholder="Municipio" type="text" name="municipio_txt" value="<%= spl[6]%>"  >
                    </td>
                    <td>
                        <p>Estado:</p>
                        <select name="estado_slc" >
                            <option value="<%= spl[7]%>"><%= spl[7]%></option>
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
                        <input  placeholder="ejemplo@correol.com" type="email" name="correo_txt" value="<%= spl[12]%>"  >
                    </td>
                    <td>
                        <p>Telefono 1:</p>
                        <input placeholder="Telefono" type="text" name="tel_fijo_txt" value="<%= spl[10]%>" >
                    </td>
                    <td>
                        <p>Telefono 2:</p>
                        <input placeholder="Celular" type="text" name="cel_txt" value="<%= spl[11]%>">
                    </td>
                    </tr>
                    <tr>
                    <td>
                        <p>Fecha de Nacimiento:</p>
                        <input type= "date"  name="nacimiento_txt" value="<%= spl[13]%>"  >
                    </td>
                    <td>
                        <div class="sexo" >
                            <p>Sexo:</p><br>
                            <p>Fem:</p> <input type="radio" name="sexo_rdo" value="F" checked />
                            <p>Masc:</p><input type="radio" name="sexo_rdo" value="M"   />
                        </div>
                    </td>
                    <td>
                        <p>RFC:</p>
                        <input placeholder="RFC" type= "text"  name="rfc_txt" value="<%= spl[14]%>" >
                    </td>
                    </tr>


                    <tr>
                    <td>
                        <p>Nombre de usuario:</p>
                        <input placeholder="Nombre de usuario" type= "text"  name="usuario_txt" value="<%= spl[17]%>"   >
                        <input type="hidden" name="usuario_hdn" value="<%= spl[17]%>">

                    </td>
                    <td>
                        <p>Contrase&ntilde;a:</p>
                        <input placeholder="Contrase&ntilde;a" type= "password"  name="contrasena_txt" value="<%= spl[18]%>" >
                    </td>
                    <td>
                        <p>Repetir Contrase&ntilde;a:</p>
                        <input placeholder="Repetir Contrase&ntilde;a" type= "password"  name="contraseña2_txt" value="<%= spl[18]%>"  >
                    </td>

                    </tr>
                </table>

                <input type="hidden" name="numemp_hdn" value="">

                <div class="terminos" style="padding: 1px 500px;"><input class="submit" type="submit" name="cambios_btn" value="Cambiar datos"></div>
            </form>
        </div>
    </body>

</HTML>



