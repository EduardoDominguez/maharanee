<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="persistencia.conexion"%>
<%@page import="modelo.InicioBean"%>
<%
    String datos[], spl[], spl1[];
    InicioBean ib = new InicioBean();
    conexion c = new conexion();
    spl = new String[5];
    //Recoge datos
    datos = ib.select();
    for (int i = 0; i < datos.length; i++) {
        System.out.print(datos[i]);
    }
    spl = datos[0].split("# ");
    spl1 = datos[1].split("# ");
        //request.setAttribute("texto", spl[1]); //Texto de id 1
    //request.setAttribute("video1", spl[2]); //Texto de id 1
    //request.setAttribute("video2", spl1[2]); //Texto de id 1
    out.print("<p style=\"text-align: justify;\">" + spl[1] + "</p>");
    HttpSession objSesion0 = request.getSession(false);
    String logeo3 = "";
    logeo3 = (String) objSesion0.getAttribute("estatuslogeo");

    if ("si".equals(logeo3)) {//Si inicio sesion
        String v = spl1[2];
        out.print("<iframe  type=\"text/html\" width=\"500\" height=\"315\" src=\"http://www.youtube.com/embed/" + v + "\" frameborder=\"0\"></iframe>");
    } else {
        String v = spl[2];
        out.print("<iframe  type=\"text/html\" width=\"500\" height=\"315\" src=\"http://www.youtube.com/embed/" + v + "\" frameborder=\"0\"></iframe>");
    }
    c.cerrarConexion();
%> 