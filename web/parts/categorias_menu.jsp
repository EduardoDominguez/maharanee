<%@page import="persistencia.conexion"%>
<%
    String x=request.getAttribute("opmenu").toString();
    if(x!=""){
        x=x;
    }else{
        x="";
    }
    conexion f = new conexion();
    String resultados[] = f.select("select * from categoria where EstCat = 'A' ORDER BY NomCat");
    for (int i = 0; i < resultados.length; i++) {
        String spl[] = resultados[i].split(", ");
            out.println("<li><a href="+x+"productos.jsp?categoria="+spl[0]+">" + spl[1] + "</a></li>");
        }
        f.cerrarConexion();
%> 