<%-- 
    Document   : reportepedidos
    Created on : 22/11/2015, 11:37:20 AM
    Author     : Roge
--%>

<%@page import="persistencia.conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedido por usuario</title>
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
        <h1>Reporte de compras por usuario</h1>
        <%
            response.setHeader("Content-Disposition", "attachment;filename=\"reporteusuario.xls\"");
            conexion c=new conexion();
            String usuario=request.getParameter("usuario");
            String res[]=c.select("select CodPro, NomPro, concat(NomPer,' ', ApePat, ' ' , ApeMat) as Nombre, UsuPer, FecCom, ForPag, PreProd, CanCom from compra as c, persona as p, producto pr where p.NumEmp = c.persona_NumEmp and c.producto_IdProd = pr.IdProd and p.UsuPer= '"+usuario+"' ORDER by c.IdCom desc");
        %>
        <h1>
            <%
                String resuser[]=c.select("Select concat(NomPer,' ', ApePat, ' ' , ApeMat) from persona where UsuPer = '"+usuario+"'");
                String spluser[]=resuser[0].split(", ");
            %>
            Reporte del usuario: <%= spluser[0] %>
        </h1>
        
        <table>
            <tr>
                <td>C&oacute;digo de producto</td>
                <td>Nombre de producto</td>
                <td>Nombre cliente</td>
                <td>Usuario</td>
                <td>Nombre cliente</td>
                <td>Fecha compra</td>
                <td>Forma de pago</td>
                <td>Precio producto</td>
                <%
                    for (int i = 0; i < res.length; i++) {
                        if(!res[0].equals("fail")){
                        String spl[]=res[i].split(", ");
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
            </tr>
            <%
                        }
                    }
                    c.cerrarConexion();
            %>
        </tr>
    </table>
    </body>
</html>
