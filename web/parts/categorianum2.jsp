<%@page import="persistencia.conexion"%>
<%
    conexion con =new conexion();
    String result[]=con.select("SELECT * from categoria WHERE EstCat = 'A' ORDER BY IdCate");
    for(int i=0; i<result.length; i++){
        String splres[]=result[i].split(", ");
        out.println("<option value=\""+splres[0]+"\"");
        if(request.getParameter("categoria_slc")!=null){
            if(request.getParameter("categoria_slc").equals(splres[1])){
                out.println("SELECTED");
            }
        }
        out.println(">"+splres[1]+"</option>");
    }
    con.cerrarConexion();
%>