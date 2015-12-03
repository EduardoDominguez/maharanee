<%-- 
    Document   : reporteproductos
    Created on : 22/11/2015, 11:04:21 AM
    Author     : Roge
--%>

<%@page import="persistencia.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Excel</title>
        <style type="text/css">
            *{
                font-family: Arial;
                font-size: 12pt;
            }
            table{
                width: 980px;
                margin: 0 auto;
                border-collapse: collapse;
            }
            td{
                border: 1px solid #222;
            }
            h1{
                font-size: 22px;
                text-transform: uppercase;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <h1>Reporte por productos</h1>
        <%
            response.setHeader("Content-Disposition", "attachment;filename=\"reporteproductos.xls\"");
            conexion c = new conexion();
            String res[] = c.select("Select * from producto");
        %>
        <table>
            <tr>
                <td>Id</td>
                <td>Imagen grande</td>
                <td>Imagen 1</td>
                <td>Imagen 2</td>
                <td>Imagen Caja</td>
                <td>Video</td>
                <td>Nombre producto</td>
                <td>C&oacute;digo</td>
                <td>Caracter&iacute;sticas</td>
                <td>Medida</td>
                <td>Piezas</td>
                <td>Precio</td>
                <td>Oferta</td>
                <td>Estatus</td>
                <td>Categoria</td>
                <%
                    for (int i = 0; i < res.length; i++) {
                        String spl[]=res[i].split(", ");
                        String rescat[]=c.select("Select NomCat from categoria where IdCate = '"+spl[14]+"'");
                        String splcat[]=rescat[0].split(", ");
                %>
            <tr>
                <td><%=spl[0]%></td>
                <td><%=spl[1]%></td>
                <td><%=spl[2]%></td>
                <td><%=spl[3]%></td>
                <td><%=spl[4]%></td>
                <td><%=spl[5]%></td>
                <td><%=spl[6]%></td>
                <td><%=spl[7]%></td>
                <td><%=spl[8]%></td>
                <td><%=spl[9]%></td>
                <td><%=spl[10]%></td>
                <td><%=spl[11]%></td>
                <td><%=spl[12]%></td>
                <td><%=spl[13]%></td>
                <td><%=splcat[0]%></td>
            </tr>
            <%
                }
                    c.cerrarConexion();
            %>
        </tr>
    </table>
</body>
</html>
