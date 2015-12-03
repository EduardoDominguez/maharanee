<%@page import="persistencia.conexion"%>
<%
    conexion c = new conexion();
    String result[]=c.select("SELECT * from categoria where EstCat ='A' ORDER BY NomCat");
    for(int i=0; i<result.length; i++){
        String spl[]=result[i].split(", ");
        out.println("<option value=\""+spl[0]+"\"");
        if(request.getParameter("categoria_slc")!=null){
            if(request.getParameter("categoria_slc").equals(spl[1])){
                out.println("SELECTED");
            }
        }
        out.println(">"+spl[1]+"</option>");
    }
    c.cerrarConexion();
%> 